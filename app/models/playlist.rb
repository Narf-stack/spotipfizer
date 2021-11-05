class Playlist < ApplicationRecord
  belongs_to :deviseuser
  has_many :tracks
  has_one :search_reco
end
