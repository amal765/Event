OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, ENV['900119531004-ibeq4f0bfknmm5p672acb560ovbp7o18.apps.googleusercontent.com'], ENV['cOocuQEhuAw4g1HedBntD9cE']
end
