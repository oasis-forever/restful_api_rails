# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.first

100.times do
  todo = Todo.create(title: Faker::Lorem.word, user_id: user.id)
  todo.items.create(name: Faker::Lorem.word, done: false)
end
