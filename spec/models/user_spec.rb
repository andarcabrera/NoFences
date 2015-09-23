require 'rails_helper'

describe User do
  let (:user) { User.new(first_name: "Alex", last_name: "Blue", email: "alex@aol.com", password: "bop") }



#METHOD TESTS WILL LIVE HERE!

  describe "#full_name" do
    it "returns the users full name" do
      expect(user.full_name).to eq("Alex Blue")
    end
  end

  describe "#display_languages" do
    user2 = User.create!(first_name: "Alex", last_name: "Blue", email: "alex@aol.com", password: "bop")
    english = Language.new(name: "English")
    spanish = Language.new(name: "Spanish")
    p user2.languages
    user2.languages << english
    user2.languages << spanish
    p user2.languages
    it "display the users languages in an easy to ready way" do
      expect(user2.display_languages).to eq("English, Spanish")
    end
  end



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

  # it "is NOT valid without an email" do
  #   user = User.new(first_name: "kyle", last_name: "heehaw")
  #   user.valid?
  #   expect(user.errors[:email]).to_not be_empty
  # end

  it "is NOT valid without an password or uid" do
    user = User.new(first_name: "kyle", last_name: "heehaw", email: "haha@b.com")
    user.valid?
    expect(user.errors[:password]).to_not be_empty
  end


  it "IS valid with an email, first name, last name, and password" do
    user = User.new(first_name: "kyle", last_name: "heehaw", email: "haha@aol.com", password: "haha")
    user.valid?
    expect(user.errors).to be_empty
  end

  it "IS valid with an email, first name, last name, and uid" do
    user = User.new(first_name: "kyle", last_name: "heehaw", email: "haha@aol.com", uid: "haha")
    user.valid?
    expect(user.errors).to be_empty
  end

 end


end

