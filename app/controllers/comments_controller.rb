class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def update
    @comment = Comment.update(comment_params)
    render json: @comment
  end

  def show
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :visible, :content)
  end
end
