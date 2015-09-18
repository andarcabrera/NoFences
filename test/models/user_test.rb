require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save a user without a first name, last name, email, password_digest" do
    user = User.new
    assert_not user.save
  end
end
