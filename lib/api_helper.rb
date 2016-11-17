class ApiHelper
  attr_accessor :response, :path, :current_user

  def initialize(current_user)
    self.current_user = current_user
  end


  def call_method(http_verb, path)
    consumer = OAuth::Consumer.new(CLIENT.consumer_key, CLIENT.consumer_secret, { :site => "https://api.twitter.com", :scheme => :header })
    token_hash = { :oauth_token => CLIENT.access_token, :oauth_token_secret => CLIENT.access_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    Rails.logger.info "\n\n\n\n====================== Initiating an API call at #{Time.now} ==================== \n"
    Rails.logger.info "http verb : #{http_verb}, path : #{path}"
    begin
      self.path = path
      self.response = access_token.request(http_verb, path)
      response_collection = JSON.parse(response.body)["statuses"]
    rescue Errno::ECONNREFUSED
      Rails.logger.error "Server is down."
      nil
    end
  end

end
