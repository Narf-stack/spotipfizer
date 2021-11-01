class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :name, default: ''
      t.string :spotify_link_album, default: ''
      t.string :spotify_track_link, default: ''
      t.text :artists,array: true, default: []
      t.string :url_image, default: ''
      t.string :spotify_track_uri, default: ''
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
