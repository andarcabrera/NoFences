require 'rails_helper'

describe User do


#METHOD TESTS WILL LIVE HERE!





  describe "validations" do

    it "is NOT valid without a first_name" do
    user = User.new(last_name: "bop", email: "bop@bop.com")
    user.valid?
    expect(user.errors[:first_name]).to_not be_empty
  end

  it "is NOT valid without a last_name" do
    user = User.new(first_name: "bop", email: "meow@aol.com" )
    user.valid?
    expect(user.errors[:last_name]).to_not be_empty
  end

  it "is NOT valid without an email" do
    user = User.new(first_name: "kyle", last_name: "heehaw")
    user.valid?
    expect(user.errors[:email]).to_not be_empty
  end

  it "IS valid with an email, first name, and last name" do
    user = User.new(first_name: "kyle", last_name: "heehaw", email: "haha@aol.com")
    user.valid?
    expect(user.errors).to be_empty
  end

 end


end

