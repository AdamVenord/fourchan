class CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = post.comments.new(comment_params)
    if @comment.save
      redirect_to follower_post_path(@post.follower_id, @post)
    else
      render :new
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end
