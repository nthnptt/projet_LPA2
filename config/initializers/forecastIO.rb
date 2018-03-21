ForecastIO.configure do |configuration|
  configuration.api_key = Rails.application.secrets.darksky_apikey
end
