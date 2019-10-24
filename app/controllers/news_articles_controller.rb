class NewsArticlesController < ApplicationController
  before_action :find_news_article, only: [:show, :destroy]

  def index
    @news_articles = NewsArticle.order(created_at: :DESC)
  end

  def show
  end


  def new
   @news_article = NewsArticle.new
  end

 def create
   @news_article = NewsArticle.new news_article_params
   if @news_article.save
     flash[:notice] = 'Article created!'
     redirect_to @news_article
   else
     render :new
   end
 end

 def destroy
   @news_article.destroy
   flash[:alert] = 'Article deleted!'
   redirect_to news_articles_path
 end

 private

 def news_article_params
   params.require(:news_article).permit(:title, :description)
 end

 def find_news_article
   @news_article = NewsArticle.find params[:id]
 end

end