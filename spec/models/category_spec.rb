require 'rails_helper'

describe Category do



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
