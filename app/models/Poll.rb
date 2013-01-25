class Poll < ActiveRecord::Base
  attr_accessible :question, :user_id

  validates :question, :length => { :minimum => 10, :maximum => 200,
    :message => ": Totally not a valid length" }
  validates :user_id, :presence => true

  has_many :answers
  has_one :user

  def self.add(question, user)
    p = Poll.create(:question => question, :user_id => user.id)
    puts p.errors.full_messages unless p.errors.empty?
    p.add_answers
  end

  def add_answers
    answer = ""
    until answer == "quit"
      puts "Add your next answer, type 'quit' to quit"
      answer = gets.chomp
      Answer.add(answer, self) unless answer == "quit"
    end
  end
end