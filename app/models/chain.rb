class Chain < ActiveRecord::Base
  belongs_to :post
  has_many :messages





def first_message?
  self.messages.empty?
end

end
