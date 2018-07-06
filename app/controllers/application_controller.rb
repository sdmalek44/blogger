class ApplicationController < ActionController::Base
  before_action :set_article, only: [:destroy, :edit, :update]
  protect_from_forgery with: :exception

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
