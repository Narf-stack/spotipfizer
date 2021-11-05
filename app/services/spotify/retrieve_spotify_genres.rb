class RetrieveSpotifyGenres < ApplicationService
    MAX_NB_GENRES=5 
    def self.call(client_spotify_token)
        headers = {   
            "Accept"=>"application/json",
            "Authorization"=>"Bearer #{client_spotify_token}",
            "Content-Type"=>"application/json"
        }

        response = HTTParty.get(
            "https://api.spotify.com/v1/recommendations/available-genre-seeds",
            :headers => headers
          )

        JSON.parse(response.body)['genres'].first(MAX_NB_GENRES)
    end
  end
  