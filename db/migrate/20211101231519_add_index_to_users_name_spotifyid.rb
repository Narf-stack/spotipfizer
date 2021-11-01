class AddIndexToUsersNameSpotifyid < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:name, :spotifyid], unique: true
  end
end
