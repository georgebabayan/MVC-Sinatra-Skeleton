class Channel < ActiveRecord::Base
  has_many :subscription
  has_many :subscribers, through: :subscription, source: :user













  def number_of_subscription
    self.subscribers.size
  end
end
