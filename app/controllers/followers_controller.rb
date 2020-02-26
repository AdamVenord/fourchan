class FollowersController < ApplicationController
  def index
    @followers = Follower.all
  end

  def show
  end

  def new
    @follower = Follower.new
    render partial: "form"
  end

  def create
    @follower = Follower.new(follower_params)

    if @follower.save
      redirect_to followers_path
    else
      render :new
    end
  end

  def update
    if @follower.update(follower_params)
      redirect_to @follower
    else
      render :edit
    end
  end

  def destroy
    @follower.destroy
    redirect_to folllowers_path
  end

  def edit
    render partial: "form"
  end

  private

    def set_follower
      @follower = Follower.find(params[:id])
    end

    def follower_params
      params.require(:follower).permit(:name)
    end
end
