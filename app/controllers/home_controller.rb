class HomeController < ApplicationController
  before_action -> { get_tweets params}
  def dashboard
    if params[:tweet]
      @no_of_unique_users = @tweets.map(&:user).uniq.count || 0
      @no_of_tweets = @tweets.map(&:text).count || 0
      @no_of_retweets = @tweets.map(&:retweet_count).inject(:+) || 0
    end
  end

  def report
    if params[:tweet_date]
      @tweets = @tweets.to_a.delete_if {|tweet| tweet.created_at.strftime("%Y-%m-%d") != params[:tweet_date]}
    else
      get_tweets(params)
    end
  end

  private
  def get_tweets(params)
    if params[:tweet]
      @tweets = CLIENT.search(params[:tweet], :lang => 'en', :count => '1000')
    end
  end
end
