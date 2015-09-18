require 'rails_helper'

describe Organization do

# METHOD TESTS WILL LIVE HERE!




  describe "validations" do

    it "IS valid without any specific information" do
      org = Organization.new
      org.valid?
      expect(org.errors).to be_empty
    end

  end


end
