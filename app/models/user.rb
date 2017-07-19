class User < ActiveRecord::Base
  has_one :car, dependent: :destroy
  has_many :providers

  after_create :send_welcome_email

  accepts_nested_attributes_for :car

  validates :email, presence: true

  enum gender: ['male', 'female']

  def self.from_omniauth(auth)
    user = joins(:providers).find_by(providers: {provider: auth.provider, uid: auth.uid})

    unless user
      logger.debug "----------------- Facebook info: #{auth.info.inspect}"
      logger.debug "----------------- Facebook extra: #{auth.extra.raw_info.inspect}"

      user = User.create(
        email: auth.info.email || auth.extra.raw_info.email || "#{auth.uid}-#{auth.provider}@flatserviceforyou.com",
        name: auth.info.first_name,
        surname: auth.info.last_name,
        gender: (User.genders.keys & [auth.extra.raw_info.gender]).first,
        location: begin auth.extra.raw_info.location[:name] rescue '' end
      )

      user.providers.create({
        provider: auth.provider,
        uid: auth.uid,
        oauth_token: auth.credentials.token,
        link: auth.extra.raw_info.link
      })
    end

    user
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end
