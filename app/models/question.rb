class Question < ActiveRecord::Base
  validates :title, :content, :votes, :user_id, :presence => true
  belongs_to :user

  after_initialize :init

  def init
    self.votes ||= 0.0
  end
end
