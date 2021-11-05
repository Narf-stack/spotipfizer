require_relative'../../services/spotify/create_spotify_playlist.rb'

class SearchRecosController < ApplicationController
    def new
        @search_reco = SearchReco.new()
    end

    def create
        # binding.pry
        playlist = instantiate_new_playlist_in_db
        search_reco = instantiate_new_search_reco_in_db(playlist)
        #GET RECO
        # if search_reco.save 
        #     flash[:notice] = "search_reco is successfully created."
        # else
        #     render action: :new, error: "Error while creating new search_reco"
        # end

    end

    def instantiate_new_playlist_in_db
        playlist = Playlist.new()
        playlist.deviseuser = curent_deviseuser
        # playlist.deviseuser = Deviseuser.order(:updated_at).last
        playlist.save

        playlist
    end

    def instantiate_new_search_reco_in_db(playlist)
        search_reco = SearchReco.new(search_reco_params)
        search_reco.playlist = playlist

        search_reco
    end

    # def create
    #     token = curent_user.spotify_access_token

    #     playlist_params = CreateSpotifyPlaylist.call(token, curent_user.spotifyid)
    #     instantiate_new_playlist_in_db(playlist_params)

    #     AddSongsToSpotifyPlaylist.call(token, playlist_params.id,uris_list)
    # end

    # def instantiate_new_playlist_in_db(params)
    #     playlist = Playlist.new(name:params['name'],
    #         description:params['description'],
    #         playlist_spotifyid:params['id'],
    #         spotify_url:params['external_urls']['spotify'],
    #         deviseuser: curent_user,
    #     )

    #     if playlist.save
    #         flash[:success] = "Your playlist has been created to your Spotify account!"
    #     else
    #         errors = playlist.errors.full_messages.to_sentence
    #         flash[:notice] = "Sorry the playlist could not be created due to Spotify API Error"
    #     end
    # end

    private
    def search_reco_params
        params.require(:search_reco).permit(:energy, :valence, :popularity, :playlist_id,genres:[])
    end
end