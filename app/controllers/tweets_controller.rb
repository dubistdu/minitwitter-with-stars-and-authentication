class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # long form -> before_action :authenticate_user!, { :except => [:index] }
  # It is referring to the index action (method in the controller)
  # It's in hash form Because we can list multiple actions to exclude
  # GET /tweets
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    # @tweet.email = current_user.email

    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  # upstar
  def star
    @tweet = Tweet.find(params[:id])
    if @tweet.not_already_stared?(current_user)
      # if @tweet.stars.where(user: current_user, upstar: true).count == 0 # ref video 31:00 / 43:00
      @tweet.stars.create(user: current_user)
      redirect_to tweets_path
    else
      redirect_to tweets_path, notice: "You've already starred"
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:text, :user_name)
    end
end
