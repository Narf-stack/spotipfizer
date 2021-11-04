class Deviseuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:omniauthable,
         omniauth_providers: %i[spotify],:authentication_keys => [:name]
  has_many :playlists
  validates_uniqueness_of :name, scope: [:spotifyid]

end
