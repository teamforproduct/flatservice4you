OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.fb_app_id, Rails.application.secrets.fb_secret,
           {scope: "email", info_fields: 'first_name,last_name,location,gender,link,email'}

  configure do |config|
        config.failure_raise_out_environments = []
    end
end

