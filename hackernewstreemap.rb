require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'sinatra'
require 'erb'

# web methods
get '/' do
	# fetch json from the api
	url = URI.parse('http://api.ihackernews.com')
	res = Net::HTTP.start(url.host, url.port) {|http|
		http.get('/page')
	}
	# parse the json
	@json = res.body #JSON.parse(res.body)
	erb :index
end