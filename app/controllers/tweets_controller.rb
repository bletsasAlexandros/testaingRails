class TweetsController < ApplicationController

    before_action :require_user_logged_in!
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    def index
        @tweets = Current.user.tweets
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Current.user.tweets.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path, notice: "Success"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @tweet.update(tweet_params)
            redirect_to tweets_path, notice: "Tweet updated"
        else
            redner :edit
        end
    end

    def destroy
        Rails.logger.info "hello"
        @tweet.destroy
        redirect_to tweets_path, notice: "tweet deleted"
    end

    private

    def tweet_params
        params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
    end

    def set_tweet
        @tweet = Current.user.tweets.find(params[:id])
    end

end