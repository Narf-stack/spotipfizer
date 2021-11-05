class CreateSpotifyPlaylist < ApplicationService

    def self.call(token,id)
        headers = { 
            "Authorization"  => "Bearer #{token}",
            "Content-Type" => "application/json"
        }


        response = HTTParty.post(
            "https://api.spotify.com/v1/users/#{id}/playlists",
            headers: headers,
            body:JSON.generate({ "name": "My Spotipfizer Playlist",
                      "description": "New playlist",
                      "public": true
                })
        )

        JSON.parse(playlist_response.body)
    end
  end
  