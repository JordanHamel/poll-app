class User < ActiveRecord::Base
  attr_accessible :name

  validates :name, :length => { :minimum => 5, :maxium => 30 }
end