class UsersController < ApplicationController

    def spotify
        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        # Now you can access user's private data, create playlists and much more
        # binding.pry

        # @user = User.new(name: spotify_user.display_name, spotifyid:spotify_user.id)
 
    end
end
