require 'twitter'

CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = "V7OXBIcvGJvHPm9EzdArKyK8Q"
  config.consumer_secret     = "PLBpixsGF1XOdL3f8EZbJnnSXJuV1IT1oV611gVqWahV4i87bc"
  config.access_token        = "798463435474206720-rEdgJ4amOieFxea9KvfjnhfgxtMlgis"
  config.access_token_secret = "rRkrjnBFMC0a7zJeaZpJx7AdgTmN284lFnMW8xo6wjnFW"
end
