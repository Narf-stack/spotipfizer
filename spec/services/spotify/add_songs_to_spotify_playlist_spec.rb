require 'rails_helper'

RSpec.describe AddSongsToPlaylist,type: :service do
    describe '#call' do
        let(:client_spotify_token){RSpotify.client_token}
        let(:playlist_id){'4Pzrhm5fXhosqQoh6iaKUS'}
        let(:playlist_id){RSpotify.client_token}

        it 'return a json of the playlist parameters' do  
            expect(CreateSpotifyPlaylist).to receive(:call).with(client_spotify_token,spotify_id) 

            url_hash = JSON.parse(response.body).external_urls
            expect(url_hash.key?("spotify")).to be true

            open_playlist_url = HTTParty.get(url_hash.spotify)
            expect(open_playlist_url.code).to be 200
        end
    end
end
