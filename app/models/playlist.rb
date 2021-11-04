class Playlist < ApplicationRecord
  belongs_to :deviseuser
  has_many :tracks
end
