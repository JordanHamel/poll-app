class User < ActiveRecord::Base
  attr_accessible :name

  validates :name, :length => { :minimum => 3, :maxium => 30,
    :message => ": There's no way that's your name" }

  def self.add(name)
    u = User.create(:name => name)
    puts u.errors.full_messages unless u.errors.empty?
    u
  end
end