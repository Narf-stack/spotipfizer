require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['CLIENT_ID_SPOTIFY'], ENV['CLIENT_SECRET_SPOTIFY'], scope: 'playlist-modify-private playlist-modify-public'
end