class ArticlesController < ApplicationController
  def index
    @articles = Article.all
   
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end  
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      if @article.published == true
        users = User.joins(:categories).where(categories: {id: @article.category_id},recieved_notificaton: true)       
        users.each do |user|
          NotificationMailer.new_article(user,self).deliver_leter
          end
          redirect_to articles_path
          #redirect_to @article, notice "Article was succesfully updated."
        else
          render :edit  
        end
      end
    end

  def published_article
    @article = Article.all
  end  
 private
  def article_params
    params.require(:article).permit(:title , :description ,:category_id)
  end

end