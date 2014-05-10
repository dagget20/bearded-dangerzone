class PlacesController < ApplicationController
	def index
		@foursquare_user = User.find(session[:user_id]) if session[:user_id]
		client = Foursquare2::Client.new(:oauth_token => @foursquare_user.token,:api_version => '20131231' ) if @foursquare_user
		if current_user
			@markers = client.recent_checkins.map do |place|
				{
				 :venue_name => place["venue"]["name"],
				 :venue_lat => place["venue"]["location"]["lat"],
				 :venue_lng => place["venue"]["location"]["lng"],
				 :friend_icon => place["user"]["photo"]["prefix"] + "64x64" + place["user"]["photo"]["suffix"]
				}
			end
		end
	end
end
