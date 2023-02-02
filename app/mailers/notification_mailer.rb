class NotificationMailer < ApplicationMailer

  
  def published_article_notification(user,article)
    @user = user
    @article = article 

    mail to: @user.email, subject:"A new article is published in #{@article.category.name}"
    end
end
