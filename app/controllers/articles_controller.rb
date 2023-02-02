class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      #redirect_to articles_path
      render json: @article
    else
      render 'new'
    end  
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all
    render json: @article
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def update
    @article = Article.find(params[:id])
    category = @article.category
    if @article.update(article_params)
      if @article.published == true
        users = User.where("interest = ? ",category)       
          users.each do |user|
          NotificationMailer.published_article_notification(user,@article).deliver_now
        end
        #redirect_to articles_path
        render json: @article
      else
        #render :edit  
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path

  end  

  def published_article
    @articles = Article.all
    @published_articles = @articles.select{|article| article.published == true }
    render json:   @published_articles 
  end 

  def display
    @users =User.all
  end 

 private
  def article_params
    params.require(:article).permit(:title , :description ,:category_id, :Date , :Day , :published)
  end

end