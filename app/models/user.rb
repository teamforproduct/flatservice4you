class User < ActiveRecord::Base
  has_one :car, dependent: :destroy
  has_many :providers

  accepts_nested_attributes_for :car

  validates :email, presence: true


  def self.from_omniauth(auth)
    user = joins(:providers).find_by(providers: {provider: auth.provider, uid: auth.uid})

    unless user
      name, surname = auth.info.name.split(' ')
      user = User.create(
        email: auth.extra.raw_info.email || "change@me-#{auth.uid}-#{auth.provider}.com",
        name: name,
        surname: surname
      )

      user.providers.create({
                              provider: auth.provider,
                              uid: auth.uid,
                              oauth_token: auth.credentials.token
                            })
    end

    user
  end
end
