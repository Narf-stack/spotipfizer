require_relative'../services/spotify/get_recommendations.rb'
require_relative'../services/spotify/create_spotify_playlist.rb'
require_relative'../services/spotify/add_songs_to_spotify_playlist.rb'

class SearchRecosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
        @search_reco = SearchReco.new()
    end

    def create
        user = Deviseuser.find(params["userid"])
        token = user.spotify_access_token

        playlist = instantiate_new_playlist_in_db(user)
        selected_genre = params[:search_reco][:genres] - %w{0}
        search_reco = instantiate_new_search_reco_in_db(playlist)
        recommendations = fetch_recommendations(token,search_reco)

        # binding.pry
        Track.create_tracks(playlist, recommendations)

        playlist_params = CreateSpotifyPlaylist.call(token, user.spotifyid)
        update_saved_playlist_in_db(playlist_params,playlist,user)
        uris_list = gather_songs_uri(playlist)

        add_songs_to_spotify(token, playlist_params['id'],uris_list)
    end

    private

    def instantiate_new_playlist_in_db(user)
        playlist = Playlist.new()
        playlist.deviseuser = user
        playlist.save

        playlist
    end

    def instantiate_new_search_reco_in_db(playlist)
        search_reco = SearchReco.new(search_reco_params)
        search_reco.genres = search_reco.genres.reject { |genre| genre == "0" }
        search_reco.playlist = playlist

        search_reco
    end

    def update_saved_playlist_in_db(params,playlist,user)
        playlist.update(name:params['name'],
            description:params['description'],
            playlist_spotifyid:params['id'],
            spotify_url:params['external_urls']['spotify'],
            deviseuser: user
        )
    end

    def gather_songs_uri(playlist)
        playlist.tracks.map do |track|
            track.spotify_track_uri
        end
    end

    def fetch_recommendations(token,search_reco)
        reco = GetRecommendations.call(token,search_reco)
        # if reco.empty?
        #     flash[:notice] = "Sorry, no playlist can get created with those parameters. Try again with others !"
        # else
        #     flash[:success] = "Great, we've found the perfect songs for you. Start the creation of your playlist"
        # end
        reco
    end

    def add_songs_to_spotify(token, playlistid,uris_list)
        
        response = AddSongsToSpotifyPlaylist.call(token, playlistid,uris_list)
        # if response.code == 200
        #     flash[:success] = "Find your playlist on your account"
        # else
        #     flash[:notice] = "Sorry, network issues. The playlist couldn't get uploaded"
        # end

        JSON.parse(response.body)
    end

    def search_reco_params
        params.require(:search_reco).permit(:energy, :valence, :popularity, :playlist_id,genres:[])
    end
end