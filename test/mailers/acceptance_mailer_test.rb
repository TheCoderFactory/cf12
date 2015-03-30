require 'test_helper'

class AcceptanceMailerTest < ActionMailer::TestCase
  test "received" do
    mail = AcceptanceMailer.received
    assert_equal "Received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "email" do
    @admission = Admission.find(1)
    @fast_track_application = FastTrackApplication.find(1)
    mail = AcceptanceMailer.email
    assert_equal "Email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
