class UsersController < ApplicationController
    $token=''
    def spotify
        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        $token = request.env['omniauth.auth']['credentials']['token']
        @user = User.find_or_create_by(name: spotify_user.display_name, spotifyid:spotify_user.id)
        if @user
            render :spotify, notice: "Welcome to a new journey'"
        else
            errors = @user.errors.full_messages.to_sentence
            redirect_to root_path, notice: "Can't logged in - errors :'#{errors}'"
        end
    end

end
