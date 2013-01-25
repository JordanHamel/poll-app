class Answer < ActiveRecord::Base
  attr_accessible :choice, :poll_id

  validates :choice, :length => { :minimum => 1, :maximum => 50 },
    :uniqueness => { :scope => :poll_id}
  validates :poll_id, :presence => true

  belongs_to :polls
end