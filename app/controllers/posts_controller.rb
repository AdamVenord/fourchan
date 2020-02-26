class PostsController < ApplicationController
  before_action :set_follower
  before_action :set_follower, only: [:show, :edit, :update, :destroy]

  def index
    @posts = @follower.posts
  end

  def show
  end

  def new
    @post = @follower.posts.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @post = @follower.posts.new(post_params)

    if @post.save
      redirect_to [@follower, @post]
    else
      render :new
    end
  end

  def update
    if @post.update(topic_params)
      redirect_to [@follower, @post]
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to follower_posts_path(@follower)
  end

  private

    def set_follower
      @follower = Follower.find(params[:follower_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :body)
    end
end
