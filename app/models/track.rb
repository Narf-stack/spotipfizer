class Track < ApplicationRecord
  belongs_to :playlist

  def self.create_tracks(playlist, recommendations)
    recommendations.each do |reco|
      track = Track.new(
        name: reco.name,
        artists: reco.artists.map{ |artist| artist.name},
        # spotify_link_album: reco.external_urls["spotify"],
        spotify_track_link: reco.external_urls["spotify"],
        spotify_track_id: reco.id,
        spotify_track_uri:reco.uri,
        url_image: reco.album.images.first['url']
      )
      track.playlist = playlist
      playlist.uris << reco.uri
      track.save
    end
  end
end
