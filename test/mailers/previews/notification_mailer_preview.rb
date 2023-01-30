# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/published_article_notification
  def published_article_notification
    NotificationMailer.published_article_notification
  end

end
