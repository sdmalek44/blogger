class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
