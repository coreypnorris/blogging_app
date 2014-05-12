class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      flash[:notice] = "Your article has been saved."
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong. Please try to save your article again."
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update article_params
      flash[:notice] = "Your article has been changed."
      redirect_to article_path @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Your article has been removed."
    redirect_to root_path
  end

private
  def article_params
    params.require(:article).permit(:name, :content)
  end
end
