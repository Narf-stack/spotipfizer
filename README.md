# Spotipfizer

This is a playlist maker using the [Spotify Web API](https://developer.spotify.com/web-api).



## Installation

1. Secret keys

Add this line to your application's Gemfile:

    gem 'dotenv-rails', groups: [:development, :test]

And then execute:

    $ bundle install

Once done, generate a .env file in order to store our keys:

    touch .env
    echo '.env*' >> .gitignore


Go in the .env file, and add our spotify keys:

    CLIENT_ID_SPOTIFY='YourSpotifyID'
    CLIENT_SECRET_SPOTIFY = 'YourClientSecret'


2. Run the migrations

    rails db:migrate



## Usage

Spotipfizer was designed with usability as its primary goal, so that you can forget the Spotify API and intuitively interact with your playlists, favorite artists, users and so on.

Once the set up is done, all you need to do is to link your spotify account to Spotifizer by signing in.

## Playlist creation

1. Go to the "Your playlist" section. 
2. Select one or more of the musical genres proposed  
3. Add a level of Energy, Valence and Popularity
4. Click on " Create Search Reco" 

Your customised playlist will be automaticaly uploaded to your Spotify account for you to enjoy.