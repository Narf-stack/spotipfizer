class AddDeviseuserToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_reference :playlists, :deviseuser, null: false, foreign_key: true
  end
end
