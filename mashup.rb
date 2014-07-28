require 'twilio-ruby'
require 'httparty'

puts "Hello! What to search for:"

search = URI.encode(gets)
response = HTTParty.get("https://api.spotify.com/v1/search?type=track&q=#{search}")
first_song = response["tracks"]["items"].first

preview_url = first_song["preview_url"]
spotify_uri = first_song["external_urls"]["spotify"]
title = first_song["name"]
artist = first_song["artists"].first["name"]
album = first_song["album"]["name"]
duration = first_song["duration_ms"].to_i / 1000




# put your own credentials here
account_sid = ENV["SPOTIFY_ACCOUNT_SID"]
auth_token = ENV["SPOTIFY_AUTH_TOKEN"]


# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+18329240395',
  :to => '123456789',
  :body => "Listen to #{title} => #{spotify_uri}",
})
