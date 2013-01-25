class Poll < ActiveRecord::Base
  attr_accessible :question, :user_id

  validates :question, :length => { :minimum => 10, :maximum => 200 }
  validates :user_id, :presence => true

  has_many :answers
  has_one :user
end