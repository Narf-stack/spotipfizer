class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :name, default: ''
      t.string :playlist_spotifyid, default: ''
      t.text :uris, array: true, default: []
      t.text :description, default: ''
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
