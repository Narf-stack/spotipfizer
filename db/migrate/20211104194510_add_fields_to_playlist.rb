class AddFieldsToPlaylist < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :energy, :integer, default: 0
    add_column :playlists, :valence, :integer, default: 0
    add_column :playlists, :popularity, :integer, default: 0
    add_column :playlists, :spotify_url, :string, default: ''
  end
end
