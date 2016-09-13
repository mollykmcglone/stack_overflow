class Question < ActiveRecord::Base
  validates :title, :content, :votes, :presence => true

  after_initialize :init

  def init
    self.votes ||= 0.0
  end
end
