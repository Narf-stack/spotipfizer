require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it "belongs to a devise user" do
    playlist = Playlist.reflect_on_association(:deviseuser)
    expect(playlist.macro).to eq(:belongs_to)
  end

  it "has many tracks" do
    playlist = Playlist.reflect_on_association(:tracks)
    expect(playlist.macro).to eq(:has_many)
  end

  it "has one search reco" do
    playlist = Playlist.reflect_on_association(:search_reco)
    expect(playlist.macro).to eq(:has_one)
  end
end
