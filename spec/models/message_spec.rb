require 'rails_helper'

RSpec.describe Message, type: :model do

  before(:each) do
    @sender = User.create!(first_name: "kyle", last_name: "bop", password: "boppy", email: "a.a.com")
    @receiver = User.create!(first_name: "heehaw", last_name: "mcdonalds", password: "boppy", email: "b.b.com")
    @message = Message.create!(subject: "test", body: "this is a test", sender_id: @sender.id, receiver_id: @receiver.id)
  end

  after(:each) do
    Message.destroy_all
    User.destroy_all
  end

  describe "#sender" do
    it "returns the sender of the message" do
      expect(@message.sender).to eq(@sender)
    end
  end

  describe "#receiver" do
    it "returns the receiver of the message" do
      expect(@message.receiver).to eq(@receiver)
    end
  end




end
