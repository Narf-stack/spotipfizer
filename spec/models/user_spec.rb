require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has many playlists" do
    user = User.reflect_on_association(:playlists)
    expect(user.macro).to eq(:has_many)
  end
  it "should have a unique name-spotifyid combinaison" do
    User.create!(name:"Jane", spotifyid:'78jdhgeb')
    user_test = User.new(name:"Jane", spotifyid:'78jdhgeb')

    expect(user_test).to_not be_valid
    expect(user_test.errors[:name]).to include("has already been taken")
  end
end
