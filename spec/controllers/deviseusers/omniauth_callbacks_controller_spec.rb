require 'rails_helper'

RSpec.describe Deviseusers::OmniauthCallbacksController, type: :controller do
    describe '#spotify' do 
        it 'should return the client_token' do
            connexion = RSpotify.authenticate(ENV['CLIENT_ID_SPOTIFY'], ENV['CLIENT_SECRET_SPOTIFY'])

            expect(connexion).to be(true)
            expect(RSpotify.client_token).to be_a(String)
        end
        it 'creates or retrieves a user'do

            # expect(Deviseuser.count).to change.from(0).to(1) 
        end
    end
end

