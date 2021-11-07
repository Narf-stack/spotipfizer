class Playlist < ApplicationRecord
  belongs_to :deviseuser
  has_many :tracks, dependent: :destroy
  has_one :search_reco, dependent: :destroy
end
