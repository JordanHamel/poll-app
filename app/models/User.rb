class User < ActiveRecord::Base
  attr_accessible :name

  validates :name, :length => { :minimum => 3, :maxium => 30,
    :message => ": There's no way that's your name" }, :uniqueness => true

  def self.add(name)
    u = User.create(:name => name)
    puts u.errors.full_messages unless u.errors.empty?
    u
  end

  def my_polls
    polls = Poll.select(:question).where(:user_id => self.id)
    polls.each { |poll| puts poll }
  end

  def respond_to_poll(poll, answer)
    Response.add(self, answer, poll)
  end
end