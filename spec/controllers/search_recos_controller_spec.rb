require 'rails_helper'

RSpec.describe SearchRecosController, type: :controller do
    describe '#new' do 
        it "should be initiating a new instance of SearchReco" do
            begin
                get :new
              rescue ActionController::MissingExactTemplate
                # this is onkay because we did not create on template on purpose
              end
            
            expect(assigns(:search_reco)).to be_a_new(SearchReco)
        end
    end

    describe '#create ' do
        let(:valid_search_reco_params)  do 
            {'search_reco' =>
                { 
                    'energy'=> 0, 
                    'valence'=> 0,
                    'popularity'=> 0,
                    'genres'=> ['salsa','club']
                }   
            }
        end
        it "should create a new search reco" do
            post :create, params: valid_search_reco_params 
            expect(assigns(:search_reco)).to be_a(SearchReco)
            expect(assigns(:search_reco)).to be_persisted
        end
        it "should set errors" do
            post :create, params: valid_search_reco_params
            puts assigns(:search_reco).errors.inspect
        end
    end
end