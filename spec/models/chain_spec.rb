require 'rails_helper'

RSpec.describe Chain, type: :model do

  before(:each) do
    @chain = Chain.create!(post_id: 2)
    @post = Post.create!(title: "test", body: "testing", author_id: 1)
    @chain2 = Chain.create!(post_id: @post.id)
    @message = Message.create!(subject: "test", body: "testing", chain_id: @chain2.id )
  end

  describe "#first_message?" do
    it "returns true if the chain is empty" do
      expect(@chain.first_message?).to eq(true)
    end

    it "returns false if the chain is not empty" do
      expect(@chain2.first_message?).to eq(false)

    end

  end

end
