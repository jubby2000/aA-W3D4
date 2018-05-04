# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all
# creates 10 random users
10.times do |_|
  User.new(username: Faker::Name.unique.name).save!
end

array = Array.new(10) {Faker::DrWho.character}
gotarray = Array.new(10) {Faker::GameOfThrones.character}
randomarray = Array.new(10) {Faker::Name.unique.name}

User.all.each_with_index do |user, idx|
  Poll.new(title: "Questions about #{array[idx]}!", user_id: user.id).save!
  Poll.new(title: "Questions about #{gotarray[idx]}!", user_id: user.id).save!
end

Poll.all.each do |poll|
  Question.new(question: "What is this character's first name?", poll_id: poll.id).save!
  Question.new(question: "What is this character's last name?", poll_id: poll.id).save!
end

i = 0
Question.all.each do |question|
  i = 0 if i == 10
  AnswerChoice.new(answer_choice: "#{array[i]}", question_id: question.id).save!
  AnswerChoice.new(answer_choice: "#{gotarray[i]}", question_id: question.id).save!
  AnswerChoice.new(answer_choice: "#{randomarray[i]}", question_id: question.id).save!
  i += 1
end

# AnswerChoice.all.each do |answer|
#   Response.new(user_id: User.all[i], answer_id: answer.id)
# end

user = User.first
answer_choices = AnswerChoice.first

first_response = Response.create!(user_id: user.id, answer_id: answer_choices.id)
poll_author = first_response.poll.author
Response.create!(user_id: poll_author.id, answer_id: answer_choices.id)
