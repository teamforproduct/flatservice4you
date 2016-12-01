OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.fb_app_id, Rails.application.secrets.fb_secret

  configure do |config|
        config.failure_raise_out_environments = []
    end
end

