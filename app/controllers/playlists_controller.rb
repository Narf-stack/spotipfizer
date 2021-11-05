require_relative'../../services/spotify/add_songs_to_spotify_playlist.rb'
# require_relative'../../services/spotify/create_spotify_playlist.rb'

class PlaylistsController < ApplicationController
    def new
        @playlist = Playlist.new()
    end

    def create
        token = curent_deviseuser.spotify_access_token

        playlist_params = CreateSpotifyPlaylist.call(token, curent_deviseuser.spotifyid)
        instantiate_new_playlist_in_db(playlist_params)

        AddSongsToSpotifyPlaylist.call(token, playlist_params.id,uris_list)
    end

    def instantiate_new_playlist_in_db(params)
        playlist = Playlist.new(name:params['name'],
            description:params['description'],
            playlist_spotifyid:params['id'],
            spotify_url:params['external_urls']['spotify'],
            deviseuser: curent_user,
        )

        if playlist.save
            flash[:success] = "Your playlist has been created to your Spotify account!"
        else
            errors = playlist.errors.full_messages.to_sentence
            flash[:notice] = "Sorry the playlist could not be created due to Spotify API Error"
        end
    end
end
