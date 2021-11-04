class RemoveUserFromPlaylists < ActiveRecord::Migration[6.0]
  def change
    remove_reference :playlists, :user, index:true, foreign_key: true
  end
end
