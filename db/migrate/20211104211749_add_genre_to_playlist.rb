class AddGenreToPlaylist < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :genres, :text, array: true, default: []

  end
end
