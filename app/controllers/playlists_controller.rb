class PlaylistsController < ApplicationController
    def new
        @playlist = Playlist.new()
    end

    def create
        CreateSpotifyPlaylist.call(curent_user.spotify_access_token, curent_user.spotifyid)
    end
end
