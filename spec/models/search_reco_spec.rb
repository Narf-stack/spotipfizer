require 'rails_helper'

RSpec.describe SearchReco, type: :model do
  it "belongs to a playlist" do
    search_reco = SearchReco.reflect_on_association(:playlist)
    expect(search_reco.macro).to eq(:belongs_to)
  end

end
