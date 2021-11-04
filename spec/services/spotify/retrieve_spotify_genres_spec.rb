require 'rails_helper'

RSpec.describe RetrieveSpotifyGenres,type: :service do
    describe '#call' do
        let(:client_spotify_token){RSpotify.client_token}

        it 'returns only the first five musical genres' do       
            # expect(RetrieveSpotifyGenres).to receive(:call).with(client_spotify_token) 

        end
    end
end
