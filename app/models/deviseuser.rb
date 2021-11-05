class Deviseuser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:omniauthable,
         omniauth_providers: %i[spotify],:authentication_keys => [:name]
  has_many :playlists
  validates_uniqueness_of :name, scope: [:spotifyid]


  def self.from_omniauth(auth)
    user = Deviseuser.find_or_create_by(
            name: auth.info.display_name, 
            spotifyid:auth.info.id,
          )
    user.persisted? ? update_user_from_spotify(user, auth) : nil
    user
  end

  def self.update_user_from_spotify(user, auth)
    user.update(
                spotify_access_token: auth.credentials.token,
                encrypted_password: Devise.friendly_token[0,20],
                # spotify_refresh_token: auth.credentials.refresh_token,
              )
  end
end
