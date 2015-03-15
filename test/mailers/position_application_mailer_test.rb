require 'test_helper'

class PositionApplicationMailerTest < ActionMailer::TestCase
  test "response" do
    mail = PositionApplicationMailer.response
    assert_equal "Response", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "received" do
    mail = PositionApplicationMailer.received
    assert_equal "Received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
