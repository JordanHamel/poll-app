class Answer < ActiveRecord::Base
  attr_accessible :choice, :poll_id

  validates :choice, :length => { :minimum => 1, :maximum => 50 },
    :uniqueness => { :scope => :poll_id}
  validates :poll_id, :presence => true

  belongs_to :polls

  def self.add(choice, poll)
    a = Answer.create(:choice => choice, :poll_id => poll.id)
    puts a.errors.full_messages unless a.errors.empty?
    a
  end

  def self.count_per_poll(poll)
    answers = Answer.where(:poll_id => poll.id)
    response_count = {}
    answers.each { |answer| response_count[answer.id] = 0}
    response_count
  end
end