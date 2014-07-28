require 'httparty'
require 'launchy'

puts "Hello! What to search for:"

search = URI.encode(gets)
response = HTTParty.get("https://api.spotify.com/v1/search?type=track&q=#{search}")
first_song = response["tracks"]["items"].first

preview_url = first_song["preview_url"]
title = first_song["name"]
artist = first_song["artists"].first["name"]
album = first_song["album"]["name"]
duration = first_song["duration_ms"].to_i / 1000

puts "Playing #{title} by #{artist}, on #{album}"
puts "It is #{duration} seconds long"

Launchy.open(preview_url)
