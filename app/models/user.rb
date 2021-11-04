class User < ApplicationRecord
    validates_uniqueness_of :name, scope: [:spotifyid]

end
