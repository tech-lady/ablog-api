class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end
  def create
    @article = Article.new(article_save)
      @article.save
  end
  def update
    @article = Article.update(article_params)
    render json: @article
  end

  def show
    render json: @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author)
  end
end
