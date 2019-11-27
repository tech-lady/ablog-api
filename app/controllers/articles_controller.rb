class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        render json: {status: :created, message: 'Successfully created article'}
      end
  end
  
  def update
    @article = Article.update(article_params)
    render json: @article
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author)
  end
end
