require 'rails_helper'

describe Post do


#METHOD TESTS WILL LIVE HERE!



  describe "validations" do

    it "is NOT valid without a title" do
      post = Post.new(author_id: 1,  body: "text", category_id: 1)
      post.valid?
      expect(post.errors[:title]).to_not be_empty
    end

    it "is NOT valid without a body" do
      post = Post.new(author_id: 1, category_id: 1, title: "test")
      post.valid?
      expect(post.errors[:body]).to_not be_empty
    end

    it "is NOT valid without an author_id ID" do
      post = Post.new(category_id: 1, body: "test", title: "test")
      post.valid?
      expect(post.errors[:author_id]).to_not be_empty
    end

    it "IS valid with a title, body, and author_id" do
      post = Post.new(author_id: 1, body: "test", title: "test")
      post.valid?
      expect(post.errors).to be_empty
    end



  end


end
