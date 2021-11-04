class AddDetailsToDeviseusers < ActiveRecord::Migration[6.0]
  def change
    add_column :deviseusers, :spotify_access_token, :text
    add_column :deviseusers, :spotifyid, :string
    add_column :deviseusers, :name, :string
  end
end
