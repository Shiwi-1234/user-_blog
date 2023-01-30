require "test_helper"

class NotificationMailerTest < ActionMailer::TestCase
  test "published_article_notification" do
    mail = NotificationMailer.published_article_notification
    assert_equal "Published article notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
