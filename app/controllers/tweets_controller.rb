class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end
  
  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    if  @tweet.save
      flash[:notice] = "投稿が完了しました"
      redirect_to root_path
    else
      flash[:danger] = "投稿できません"
      render '/tweets/new'
    end
  end
  
  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end
  
  def update
    @tweet = Tweet.find_by(id: params[:id])
    # @tweet.content = params[:content]
    # if tweet.save
    if @tweet.update(tweet_params)
     flash[:notice] = "投稿を編集しました"
     redirect_to root_path
    else
      flash[:danger] = "編集できませんでした"
      render '/tweets/edit'
    end
  end
  
  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to root_path
  end
  
   private
  def tweet_params
    params.require(:tweet).permit(:name, :content)
  end
end
