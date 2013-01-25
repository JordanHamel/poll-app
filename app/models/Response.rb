class Response < ActiveRecord::Base
  attr_accessible :user_id, :answer_id, :poll_id

  validates :user_id, :uniqueness => { :scope => :poll_id }, :presence => true
  validates :answer_id, :presence => true
  validates :poll_id, :presence => true
end