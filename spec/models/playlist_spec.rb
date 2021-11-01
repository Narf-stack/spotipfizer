require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it "belongs to a user" do
    playlist = Playlist.reflect_on_association(:user)
    expect(playlist.macro).to eq(:belongs_to)
  end

  it "has many tracks" do
    playlist = Playlist.reflect_on_association(:tracks)
    expect(playlist.macro).to eq(:has_many)
  end
end
