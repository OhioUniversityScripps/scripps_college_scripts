require "net/http"
require "uri"

uri = URI.parse("http://www.google.com/")

# Full
http = Net::HTTP.new(uri.host, uri.port)
response = http.request(Net::HTTP::Get.new(uri.request_uri))
puts response