# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([
  { title: 'history' },
  { title: 'math' }
])

tests = Test.create!([
  { title: 'WW1', level: 1, category:  categories.first },
  { title: 'geometry', level: 2, category: categories.last }
])

questions = Question.create!([
  { body: 'what year did ww1 started?', test: tests.first },
  { body: 'which country made declaration of ww1?', test: tests.first },
  { body: 'how to find S of triangle?', test: tests.last },
  { body: 'sin of 60?', test: tests.last }
])

answers = Answer.create!([
  { body: '1994', question: questions.first },
  { body: '1894', question: questions.first },
  { body: '1995', question: questions.first },
  { body: '0.5*a*h', question: questions.last },
  { body: '0.5*a^2', question: questions.last },
])

users = User.create!([
  {
    username: 'jack', email: 'jack@mail.com',
    password: jack_isBest, test: tests.last
 }
])
