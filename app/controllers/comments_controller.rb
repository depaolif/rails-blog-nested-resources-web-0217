require 'pry'

class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @post = Post.find(params[:post_id])
    @post.comments << @comment
    redirect_to @post
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
