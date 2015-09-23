require 'rails_helper'

describe Category do

  before(:each) do
    @category = Category.create!(name: "test")
    @post1 = Post.create!(title: "testpost", body: "woop", author_id: 1, category_id: @category.id, volunteer: false)
    @post2 = Post.create!(title: "testpost2", body: "woopy", author_id: 1, category_id: @category.id, volunteer: false)
    @post3 = Post.create!(title: "testpost3", body: "woopd", author_id: 1, category_id: @category.id, volunteer: true)
    @post4 = Post.create!(title: "testpost4", body: "woopw", author_id: 1, category_id: @category.id, volunteer: true)
  end

  after(:each) do
    Category.destroy_all
    Post.destroy_all
  end

  describe "#services_offered" do
    it "returns all of the services where volunteer is true" do
      expect(@category.services_offered).to include(@post3, @post4)
    end

    it "does NOT return posts where volunteer is false" do
      expect(@category.services_offered).to_not include(@post1, @post2)
    end

    it "orders the posts by most recent" do
      expect(@category.services_offered).to eq([@post4, @post3])
    end
  end

  describe "#services_wanted" do
    it "returns all of the posts where volunteer is false" do
      expect(@category.services_wanted).to include(@post1, @post2)
    end

    it "does NOT return posts where volunteer is true" do
      expect(@category.services_wanted).to_not include(@post3, @post4)
    end

    it "orders the posts by most recent" do
      expect(@category.services_wanted).to eq([@post2, @post1])
    end


  end





  describe "validations" do

    it "is NOT valid without a name" do
      cat = Category.new
      cat.valid?
      expect(cat.errors[:name]).to_not be_empty
    end

    it "IS valid with a name" do
      cat = Category.new(name: "test")
      cat.valid?
      expect(cat.errors).to be_empty
    end
  end
end
