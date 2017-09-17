require 'net/http'
require 'uri'
require 'json'

uri = URI.parse(ENV["HOTEL_API_URL"])

header = {'Content-Type': 'application/json'}

args = JSON.parse(ARGF.read)

hotel_request = {
  city: args["city"],
  hotel: args["hotel"]
}

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = hotel_request.to_json
response = http.request(request)

puts response.body
