class AddSongsToSpotifyPlaylist < ApplicationService

    def self.call(token,playlist_id,uris_list)
        headers = { 
            "Authorization"  => "Bearer #{token}",
            "Content-Type" => "application/json"
        }
 

        response = HTTParty.post(
            "https://api.spotify.com/v1/playlists/#{playlist_id}/tracks",
            headers: headers,
            body:JSON.generate({ "uris": uris_list})
        )

        JSON.parse(response.body)
    end
  end
  