class Deviseusers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # rescue_from ActionDispatch::Cookies::CookieOverflow,  with: :clean_spotify_cookies
    
    def spotify
    #   session[:spotify_auth] = request.env['omniauth.auth']
      @user = Deviseuser.find_or_create_by(
            name: request.env['omniauth.auth'].info.display_name, 
            spotifyid:request.env['omniauth.auth'].info.id,
        )
      
        if @user.persisted?
            @user.update(spotify_access_token: request.env['omniauth.auth'].credentials.token,
                         encrypted_password: Devise.friendly_token[0,20],
                        # refresh_token: request.env['omniauth.auth'].credentials.refresh_token,
                        # expires_on: (Time.now + 3600).to_datetime
                    )
            render :file => 'deviseusers/spotify.html', notice: "Welcome to a new journey'"
            set_flash_message(:notice, :success, kind: 'Spotify') if is_navigational_format?
        else
            # session['devise.spotify_data'] = request.env['omniauth.auth']
            redirect_to root_path, notice: "Sorry you need to have a Spotify account to continue"
        end
    end
    
    def failure
        flash[:notice] = 'We were not able to sign you in ! Please retry, or contact us if \
                            the issue keeps going'
        redirect_to root_path
    end

    private
    def clean_spotify_cookies
        # session.clear
        session.delete(:spotify_auth)
        session[:spotify_auth] = request.env['omniauth.auth']
    end
  end
  