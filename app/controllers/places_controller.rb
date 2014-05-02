class PlacesController < ApplicationController
	def index
		@foursquare_user = User.find(session[:user_id]) if session[:user_id]
		@client = Foursquare2::Client.new(:oauth_token => @foursquare_user.token,:api_version => '20131231' ) if @foursquare_user

	end
end
