puts "Who are you?"
me = User.add(gets.chomp)

puts "Create a poll: "
question = gets.chomp
Poll.add(question, me)