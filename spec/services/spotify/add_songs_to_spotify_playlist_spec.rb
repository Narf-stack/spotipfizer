require 'rails_helper'

RSpec.describe AddSongsToPlaylist,type: :service do
    describe '#call' do
        let(:client_spotify_token){RSpotify.client_token}
        let(:playlist_id){'4Pzrhm5fXhosqQoh6iaKUS'}
        let(:uris){["spotify:track:2yUNna6E6MKHiCkKdvA5Uo","spotify:track:0PuxFPoTO5Ox8JLxO7JuZX"]}

        it 'adds songs to a specified playlist' do  
            expect(AddSongsToPlaylist).to receive(:call).with(client_spotify_token,playlist_id,uris) 

            response_hash = JSON.parse(response.body).external_urls
            expect(response_hash.key?("snapshot_id")).to be true


        end
    end
end
