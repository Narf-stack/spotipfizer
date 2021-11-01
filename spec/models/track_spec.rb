require 'rails_helper'

RSpec.describe Track, type: :model do
  it "belongs to a playlist" do
    track = Track.reflect_on_association(:playlist)
    expect(track.macro).to eq(:belongs_to)
  end
end
