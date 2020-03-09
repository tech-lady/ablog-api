class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_article_comment, only: %i[show update destroy]

  def index
    json_response(@article.comments)
  end

  def create
    @article.comments.create!(comment_params)
    json_response(@article, :created)
  end

  def update
    @comment.update(comment_params)
    head :no_content
  end

  def show
    json_response(@comment)
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:name, :visible, :content)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_article_comment
    @comment = @article.comments.find_by!(id: params[:id]) if @article
  end

end
