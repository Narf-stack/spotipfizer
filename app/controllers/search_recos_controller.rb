class SearchRecosController < ApplicationController
    def new
        @search_reco = SearchReco.new()
    end

    def create
        @search_reco = SearchReco.new(search_reco_params)
        if @search_reco.save 
            flash[:notice] = "search_reco is successfully created."
        else
            render action: :new, error: "Error while creating new search_reco"
        end
    end

    private
    def search_reco_params
        params.require(:search_reco).permit(:energy, :valence, :popularity, :playlist_id,genres:[])
    end
end