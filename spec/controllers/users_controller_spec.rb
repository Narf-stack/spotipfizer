require 'rails_helper'
require 'httparty'

RSpec.describe UsersController, type: :controller do
    it 'assigns a global variable for the spotify token'do
        # token  = UsersController.$token
        # expect(token.class).to eq(String)
    end

    describe '#spotify' do 
        it 'authenticates the playlist app' do
            connexion = RSpotify.authenticate(ENV['CLIENT_ID_SPOTIFY'], ENV['CLIENT_SECRET_SPOTIFY'])
            expect(connexion).to be(true)
        end
        it 'creates or retrieves a user'do

            # expect(User.count).to change.from(0).to(1) 
            # expect(User.count).to change.from(0).to eq(1) 
        end
    end
end

