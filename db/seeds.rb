# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
levels = ['Basic', 'Level 1', 'Level 2', 'Level 3', 'Level 4']

p = 'Lando'
users = [
  {name: 'Eli', email: 'eli@fake.com', password: p, course_id: 3, is_teacher: true},
  {name: 'Aubrey', email: 'aubrey@fake.com', password: p, course_id: 1, is_teacher: true},
  {name: 'Jimmy', email: 'jimmy@fake.com', password: p, course_id: 3, is_teacher: false},
  {name: 'Mark', email: 'mark@fake.com', password: p, course_id: 3, is_teacher: false},
  {name: 'Sue', email: 'sue@fake.com', password: p, course_id: 1, is_teacher: false},
  {name: 'Barry', email: 'barry@fake.com', password: p, course_id: 1, is_teacher: false},
  {name: 'Larry', email: 'larry@fake.com', password: p, course_id: 2, is_teacher: false},
  {name: 'Harry', email: 'harry@fake.com', password: p, course_id: 5, is_teacher: false},
  {name: 'Phillip', email: 'phillip@fake.com', password: p, course_id: 1, is_teacher: false},
  {name: 'Reggie', email: 'reggie@fake.com', password: p, course_id: 5, is_teacher: false},
  {name: 'Denise', email: 'denise@fake.com', password: p, course_id: 3, is_teacher: false},
  {name: 'Marty', email: 'marty@fake.com', password: p, course_id: 4, is_teacher: false}
]

materials = [
  {name: 'Google', description: 'A very good search engine', url: 'www.google.com', course_id: 3},
  {name: 'Google Translator', url: 'translate.google.com', course_id: 1},
  {name: 'Grammar 101', url: 'www.englishgrammar101.com', course_id: 1},
  {name: 'Grammar 101', url: 'www.englishgrammar101.com', course_id: 3},
  {name: '100 Words', url: 'www.ef.com/wwen/english-resources/english-vocabulary/top-100-words', course_id: 1},
  {name: 'Past Tense', url: 'www.wordhippo.com/what-is/the-past-tense-of/help.html', course_id: 3},
]

levels.each do |level|
  Course.create(name: level)
end

users.each do |user|
  User.create(user)
end

materials.each do |material|
  Material.create(material)
end
