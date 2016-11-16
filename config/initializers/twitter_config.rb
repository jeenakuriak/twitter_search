require 'twitter'

CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = Twitter::CONSUMERKEY
  config.consumer_secret     = Twitter::CONSUMERSECRET
  config.access_token        = Twitter::ACCESSTOKEN
  config.access_token_secret = Twitter::ACCESSTOKENSECRET
end
