OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook.key, Settings.facebook.secret, {:client_options => {:ssl => {:ca_path => '/etc/ssl/certs'}}, provider_ignores_state: true}
end