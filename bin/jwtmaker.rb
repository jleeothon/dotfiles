require 'bundler/inline'
require 'date'

gemfile do
	source 'https://rubygems.org'
	gem 'jwt', require: true
end

payload = {
	exp: (DateTime.now + 1).strftime('%s'),
	sessId: ARGV.fetch(0),
	certId: 449,
	action: 'GET_GDPR_EXPORT',
	params: '100000',
}

puts "payload:"

p payload

token = JWT.encode payload, 'My4dm1nKey'

puts "token:"

p token

decoded_token = JWT.decode token, 'My4dm1nKey'

p decoded_token

