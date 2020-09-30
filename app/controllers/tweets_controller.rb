class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image)
  end
end
