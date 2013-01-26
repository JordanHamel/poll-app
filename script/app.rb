# puts "Who are you?"
# me = User.add(gets.chomp)

# while true
#   puts "Want to create a poll?"

#   if gets.chomp == 'y'
#     puts "Create a poll: "
#     question = gets.chomp
#     Poll.add(question, me)
#   end

#   break if gets.chomp == 'n'
# end

# me = User.find(6)
# me.my_polls


# enter a username

def log_in
  puts "Please enter your name: "
  name = gets.chomp
  user = nil
  if User.where(:name => name).nil?
    user = User.add(name)
  else
    user = User.where(:name => name).limit(1)
  end
end

def pick_poll(user)
  possibles = Poll.eligible_polls(user)
  possibles.each do |poll|
    puts "#{poll.id}) #{poll.question}"
  end

  puts "Which poll do you want?"
  choice = gets.chomp.to_i
  Poll.where(:id => choice)
end

def answer_poll(user, poll)
  answers = poll.get_answers

  puts poll.question
  answers.each { |answer| puts "#{answer.id}) #{answer.choice}" }
  puts "What do you think?"
  answer = gets.chomp
  Response.add(user, answer, poll)
end

def show_poll_results(poll)
  poll_status = Response.poll_responses(poll)
  answers = Answer.where(:poll_id => poll.id)

  poll_status.each do |key, value|
    answers.each do |answer|
      puts "#{answer.choice}: #{value}" if key == answer.id
    end
  end
end


# def run

#   log_in

#   show_commands
# # ask, answer, quit commands

# # while true

#   # case

#   # answer

#     answer

#   # ask
#     ask

#   # break when 'quit'

# end

user = log_in
poll = pick_poll(user)
answer_poll(poll)
show_poll_results(poll)











