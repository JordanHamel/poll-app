class Response < ActiveRecord::Base
  attr_accessible :user_id, :answer_id, :poll_id

  validates :user_id, :uniqueness => { :scope => :poll_id, :messsage => ": You already answered" },
  :presence => true
  validates :answer_id, :presence => true
  validates :poll_id,  :presence => true

  def self.add(user, answer, poll)
    r = Response.create(:user_id => user.id, :answer_id => answer.id, :poll => poll.id)
    puts r.errors.full_messages unless r.errors.empty?
    r
  end

  # User submits response and we show them results so far for poll, count for each answer for poll
  def poll_responses(poll)
    response_count = Answer.count_per_poll(poll)

    responses = self.where(:poll_id => poll.id)
    responses.each { |response| response_count[response.answer_id] += 1 }

    response_count
  end
end