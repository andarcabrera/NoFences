require 'rails_helper'

describe User do
  before(:each) do

    @user = User.create!(first_name: "Alex", last_name: "Blue", email: "alex@aol.com", password: "bop")
    @english = Language.new(name: "English")
    @spanish = Language.new(name: "Spanish")
    @french = Language.create!(name: "French")
    @post1 = Post.new(title: "test", body: "test", volunteer: true)
    @post2 =  Post.new(title: "test", body: "test", volunteer: false)
    @user.posts << @post1
    @user.posts << @post2
    @user.languages << @english
    @user.languages << @spanish
    @chain = Chain.create!(post_id: @post1.id)
    @chain2 = Chain.create!(post_id: @post2.id)
    @message1 = Message.create!(sender_id: @user.id, chain_id: @chain.id)
    @message2 = Message.create!(receiver_id: @user.id, chain_id: @chain.id)
    @message3 = Message.create!(chain_id: @chain2.id)
  end
  after(:each) do
      User.destroy_all
      Post.destroy_all
      Message.destroy_all
      Language.destroy_all
    end


#METHOD TESTS WILL LIVE HERE!

  describe "#full_name" do
    it "returns the users full name" do
      expect(@user.full_name).to eq("Alex Blue")
    end
  end

  describe "#display_languages" do

    it "display the users languages in an easy to ready way" do
      expect(@user.display_languages).to eq("English, Spanish")
    end
  end

  describe "#get_volunteer_posts" do
    it "returns only the posts a user is a volunteer for" do
      expect(@user.get_volunteer_posts).to include(@post1)
    end
    it "does NOT return posts that are not volunteer posts" do
      expect(@user.get_volunteer_posts).to_not include(@post2)
    end
  end

  describe "#count_volunteer_posts" do
    it "returns the number of volunteer posts a user has made" do
      expect(@user.count_volunteer_posts).to eq(1)
    end
  end

  describe "#update_known_languages" do
    it "Adds a new language to the user if not already known" do
      language_array = ["English", "Spanish", "French"]
      @user.update_known_languages(language_array)
      expect(@user.languages).to include(@french)
    end
  end

  describe "#messages" do
    it "returns the messages where the user is the sender or receiver" do
      expect(@user.messages).to include(@message1, @message2)
    end

    it "does NOT return the messages where the user is NOT the sender or receiver" do
      expect(@user.messages).to_not include(@message3)
    end
  end

  describe "#chains" do
    it "returns the chains associated" do
      expect(@user.chains).to include(@chain)
    end

    it "does NOT return the chains not associated to a user" do
        expect(@user.chains).to_not include(@chain2)
    end
  end

  describe "#already_messaged?" do
    it "returns true if the user has already messaged a post" do
      expect(@user.already_messaged?(@post1)).to eq(true)
    end


    it "returns false if the user has not messaged a post" do
      p @user.chains
      expect(@user.already_messaged?(@post2)).to eq(false)
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

