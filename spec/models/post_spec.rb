require 'rails_helper'

describe Post do

  before(:each) do
    @post = Post.create!(title: "test", body: "this is a test", author_id: 1)
  end

  after(:each) do
    Post.destroy_all
  end

  describe "#posted_date" do
    it "returns the date of the post in month day year format" do
    expect(@post.posted_date).to eq(DateTime.now.strftime("%m-%d-%y"))
    end
  end

  describe "#search" do
    it "returns a post with the same or similiar title" do
      expect(Post.search("tes")).to include(@post)
    end

    it "returns a post that has something similiar in its body" do
      expect(Post.search("this")).to include(@post)
    end

    it "does NOT return a post with a non similiar title and non similiar body" do
      expect(Post.search("bop")).to_not include(@post)
    end

  end


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
