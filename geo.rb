require 'geocoder'

puts "What you want to know, yo"

result = Geocoder.search gets
geometry =  result.first.geometry
lat = geometry.fetch("location").fetch("lat")
lng = geometry.fetch("location").fetch("lng")

puts "Thats at #{lat},#{lng}"
