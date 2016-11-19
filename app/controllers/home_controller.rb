class HomeController < ApplicationController
  before_action -> { get_tweets params}
  def dashboard
    if params[:tweet]
      @no_of_unique_users = @tweet_user.flatten.uniq.count
      @no_of_tweets = @tweets.flatten.compact.count || 0
      @no_of_retweets = @retweets.flatten.compact.count || 0
    end
  end

  def report
    if params[:tweet_date]
      @tweet_by_date = @tweet_results.map{|tweet| tweet if tweet["created_at"].to_date.strftime("%Y-%m-%d") == params[:tweet_date]}.compact
    end
  end

  private
  def get_tweets(params)
    if params[:tweet]
      path = "https://api.twitter.com/1.1/search/tweets.json?q=#{params[:tweet]}&result_type=popular"
      api_helper = ApiHelper.new(current_user)
      @tweet_results = api_helper.call_method('get', path)
      @tweets = []
      @tweet_user = []
      @retweets = []
      @tweet_results.map do |tweet|
        @tweet_user << tweet["user"]["id"]
        @tweets << tweet["text"]
        @retweets << tweet["retweeted_status"]["text"] if tweet["retweeted"]
      end
    end
  end

end
