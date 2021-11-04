class AddIndexToDeviseusersNameSpotifyid < ActiveRecord::Migration[6.0]
  def change
    add_index :deviseusers, [:name, :spotifyid], unique: true
  end
end
