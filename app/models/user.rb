class User < ApplicationRecord
    has_many :playlists
    validates_uniqueness_of :name, scope: [:spotifyid]

end
