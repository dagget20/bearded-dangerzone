Rails.application.config.middleware.use OmniAuth::Builder do 
	#provide :foursquare, "API_KEY", "API_SECRET"
	provider :foursquare, "api_key", "api_secret"
end
