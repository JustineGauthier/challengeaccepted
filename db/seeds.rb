# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destoying all"

Progression.destroy_all
Participation.destroy_all
User.destroy_all
Challenge.destroy_all

puts "creating challenges"
challenge = Challenge.create!(title: "Bouge ton boul'", description: "Trois semaines de pur bonheur (et de squat 1x/jours...) !
Bon courage les filles !", frequency: 'quotidien', start_date: 20220515, end_date: 20220513, points: 531, total_time: 30)
challenge2 = Challenge.create!(title: "Aller hop !", description: "Un kilomètre à pied ça useuuh, ça useuuuh.
Un kilomètre à pied, ça useuuuuh les soulieeeeers !", frequency: 'hebdomadaire', start_date: 20220501, end_date: 20220627, points: 1046, total_time: 52)
challenge3 = Challenge.create!(title: "Ratatooooooouille", description: "Ta mission, si tu l'acceptes, faire un plat
végétarien par semaine sur un mois", frequency: 'hebdomadaire', start_date: 20220601, end_date: 20220701, points: 997, total_time: 30)

puts "creating users"

part1 = Participation.create!(challenge: challenge, user: user1)
# part2 = Participation.create!(challenge: challenge, user: user2)
# part3 = Participation.create!(challenge: challenge, user: user3)
part4 = Participation.create!(challenge: challenge2, user: user1)
# part5 = Participation.create!(challenge: challenge2, user: user2)
# part6 = Participation.create!(challenge: challenge2, user: user3)
part7 = Participation.create!(challenge: challenge3, user: user1)
# part8 = Participation.create!(challenge: challenge3, user: user2)
# part9 = Participation.create!(challenge: challenge3, user: user3)

Progression.create!(date: 20220515, done: false, participation: part1)
Progression.create!(date: 20220516, done: false, participation: part1)
Progression.create!(date: 20220517, done: false, participation: part1)
Progression.create!(date: 20220518, done: false, participation: part1)

# Progression.create!(date: 20220515, done: true, participation: part2)
# Progression.create!(date: 20220516, done: true, participation: part2)
# Progression.create!(date: 20220517, done: true, participation: part2)
# Progression.create!(date: 20220518, done: true, participation: part2)

# Progression.create!(date: 20220515, done: false, participation: part3)
# Progression.create!(date: 20220516, done: true, participation: part3)
# Progression.create!(date: 20220517, done: false, participation: part3)
# Progression.create!(date: 20220518, done: true, participation: part3)

Progression.create!(date: 20220515, done: false, participation: part4)
Progression.create!(date: 20220516, done: false, participation: part4)
Progression.create!(date: 20220517, done: false, participation: part4)
Progression.create!(date: 20220518, done: false, participation: part4)

# Progression.create!(date: 20220515, done: true, participation: part5)
# Progression.create!(date: 20220516, done: true, participation: part5)
# Progression.create!(date: 20220517, done: true, participation: part5)
# Progression.create!(date: 20220518, done: true, participation: part5)

# Progression.create!(date: 20220515, done: false, participation: part6)
# Progression.create!(date: 20220516, done: true, participation: part6)
# Progression.create!(date: 20220517, done: false, participation: part6)
# Progression.create!(date: 20220518, done: true, participation: part6)

Progression.create!(date: 20220515, done: false, participation: part7)
Progression.create!(date: 20220516, done: false, participation: part7)
Progression.create!(date: 20220517, done: false, participation: part7)
Progression.create!(date: 20220518, done: false, participation: part7)

# Progression.create!(date: 20220515, done: true, participation: part8)
# Progression.create!(date: 20220516, done: true, participation: part8)
# Progression.create!(date: 20220517, done: true, participation: part8)
# Progression.create!(date: 20220518, done: true, participation: part8)

# Progression.create!(date: 20220515, done: false, participation: part9)
# Progression.create!(date: 20220516, done: true, participation: part9)
# Progression.create!(date: 20220517, done: false, participation: part9)
# Progression.create!(date: 20220518, done: true, participation: part9)
