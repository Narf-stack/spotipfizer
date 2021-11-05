require 'rails_helper'

RSpec.describe GetRecommendations,type: :service do
    describe '#call' do
        let(:client_spotify_token){RSpotify.client_token}
        let(:params){
            {
                seed_genres: ['pop'],
                target_energy: 1,
                target_valence: 1,
                target_popularities: 1,
                limit: max_tracks,
                from_token: token
            }
        }
        it 'return a json of songs recommendations' do
            RSpotify.authenticate(ENV['CLIENT_ID_SPOTIFY'], ENV['CLIENT_SECRET_SPOTIFY'])

            expect(GetRecommendations).to receive(:call).with(client_spotify_token,params) 


        end
    end
end
