class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = current_user.articles
      json_response(@articles)
  end

  def create
    @article = current_user.articles.create!(article_params)
    json_response(@article, :created)
  end

  def update
    @article.update(article_params)
    head :no_content
  end

  def show
    json_response(@article)
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.permit(:title, :content, :author)
  end
end
