class GetRecommendations < ApplicationService
    def self.call(token,params={})
        max_tracks = 5
        RSpotify.authenticate(ENV['CLIENT_ID_SPOTIFY'], ENV['CLIENT_SECRET_SPOTIFY'])

        recommendations = RSpotify::Recommendations.generate(
            seed_genres: params[:genres],
            target_energy: params[:energy],
            target_valence: params[:valence],
            target_popularities: params[:popularity],
            limit: max_tracks,
            from_token: token
        )
        # recommendations = RSpotify::Recommendations.generate(
        #     seed_genres: ['pop'],
        #     target_energy: 1,
        #     target_valence: 1,
        #     target_popularities: 1,
        #     limit: max_tracks,
        #     from_token: token
        # )
        
        recommendations.tracks
    end


    def request_httparty(params,token)
        query = { 
            "max_energy" => params[:energy],
            "max_popularity" => params[:popularity],
            "max_valence" => params[:valence],
            "seed_genres" => params[:genres],
        }

        headers = { 
            "Authorization"  => "Bearer #{token}",
            "Content-Type" => "application/json"
        }

        recommendations_response = HTTParty.get(
            "https://api.spotify.com/v1/recommendations", 
            :query => query,
            :headers => headers
        )
    end
end