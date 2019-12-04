class ArticlesController < ApplicationController
  before_action :set_article, except: %i[index create]
  def index
    @articles = Article.all
    render json: @articles
  end

  def create
    @article = Article.create!(article_params)
    if @article
      render json:  @article, status: :created, message: 'Successfully created article' 
    else
      render json: { status: :bad_request, message: 'Unable to create article' }
    end
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok, message: 'Successfully updated article' 
    else
      render json: { status: :bad_request, message: 'Unable to create article' }  
    end
  end

  def show
    @article = Article.find(params[:id])
    render json: @article, status: :ok
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      render json: { status: :ok, message: 'Successfully deleted article!'}
    else
      render json: { status: :unprocessable_entity, message: 'Unable to delete article' }
    end
  end

  private

  def set_article
    @article = Article.find_by_id(params[:id])
    render json: {
      error: 'not found'
    }, status: :not_found if @article.nil?
  end

  def article_params
    params.permit(:title, :content, :author, :user_id)
  end
end
