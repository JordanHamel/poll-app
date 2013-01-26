class Poll < ActiveRecord::Base
  attr_accessible :question, :user_id

  validates :question, :length => { :minimum => 10, :maximum => 200,
    :message => ": Totally not a valid length" }
  validates :user_id, :presence => true

  has_many :answers
  has_one :user

  has_many :responses

  def self.add(question, answers, user)
    p = Poll.create(:question => question, :user_id => user.id)
    puts p.errors.full_messages unless p.errors.empty?
    p.add_answers(answers)
    p
  end

  def self.eligible_polls(user)
    Poll.includes(:responses).where("user_id != ?", user.id)
  end

  def add_answers(answers_array)
    answers_array.each { |answer| Answer.add(answer, self) }
  end

  def get_answers
    answers = Answer.where(:poll_id => self.id)
    puts self.question
    answers
  end
end