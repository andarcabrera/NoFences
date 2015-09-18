require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "should save, even without any specific data" do
    org = Organization.new
    assert org.save
  end
end
