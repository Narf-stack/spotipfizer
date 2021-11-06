require_relative'../../services/spotify/get_recommendations.rb'
require_relative'../../services/spotify/create_spotify_playlist.rb'
require_relative'../../services/spotify/add_songs_to_spotify_playlist.rb'

class SearchRecosController < ApplicationController
    def new
        @search_reco = SearchReco.new()
    end

    def create
        # binding.pry
        token = curent_deviseuser.spotify_access_token

        playlist = instantiate_new_playlist_in_db

        search_reco = instantiate_new_search_reco_in_db(playlist)
        recommendations = GetRecommendations.call(token,search_reco)

        Track.create_tracks(playlist, recommendations)

        playlist_params = CreateSpotifyPlaylist.call(token, curent_deviseuser.spotifyid)
        update_saved_playlist_in_db(playlist_params,playlist)

        AddSongsToSpotifyPlaylist.call(token, playlist_params.id,uris_list)
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

    def update_saved_playlist_in_db(params,playlist)
        playlist.update(name:params['name'],
            description:params['description'],
            playlist_spotifyid:params['id'],
            spotify_url:params['external_urls']['spotify'],
            deviseuser: curent_deviseuser
        )
    end

    private
    def search_reco_params
        params.require(:search_reco).permit(:energy, :valence, :popularity, :playlist_id,genres:[])
    end
end