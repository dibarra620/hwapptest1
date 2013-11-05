require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "new_tasklist" do
    mail = Notifications.new_tasklist
    assert_equal "New tasklist", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
