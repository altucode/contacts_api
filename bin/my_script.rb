require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html'
).to_s

puts RestClient.get(url)

vals = {
  user: {
    email: "constance.io"
  }
}

url2 = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/7.html'
).to_s

puts RestClient.patch(url2, vals)