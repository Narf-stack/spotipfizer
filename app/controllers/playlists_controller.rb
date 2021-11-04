class PlaylistsController < ApplicationController
    def new
        @playlist = Playlist.new()
    end

    def create
        token = curent_user.spotify_access_token
        playlist_params = CreateSpotifyPlaylist.call(token, curent_user.spotifyid)
        
        AddSongsToSpotifyPlaylist.call(token, playlist_params.id,uris_list)
    end
end
