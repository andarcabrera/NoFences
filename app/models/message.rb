class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :chain


  def sender
    User.find(self.sender_id)
  end

  def receiver
    User.find(self.receiver_id)
  end

end
