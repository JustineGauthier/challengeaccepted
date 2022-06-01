# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Progression.destroy_all
Participation.destroy_all
User.destroy_all
Challenge.destroy_all

challenge = Challenge.create( title: "Bouge ton boul'", description: "Trois semaines de pur bonheur (et de squat 1x/jours...) !
Bon courage les filles !", frequency: 'quotidien', start_date: 20220515, end_date: 20220513, points: 531, total_time: 31)

user1 = User.create(email: 'bouh@bouh.fr', password: 'Bouhbouh', name: 'Bouh',
            description: 'bouhbouhbouh bouh bouhbouh bouh bouh', total_points: 685)
user2 = User.create(email: 'flo@flo.fr', password: 'floflo', name: 'flo',
            description: 'flofloflo flo floflo flo flo', total_points: 685)
user3 = User.create(email: 'julie@julie.fr', password: 'juliejulie', name: 'julie',
            description: 'juliejuliejulie julie juliejulie julie julie', total_points: 685)

part1 = Participation.create(challenge: challenge, user: user1)
part2 = Participation.create(challenge: challenge, user: user2)
part3 = Participation.create(challenge: challenge, user: user3)

Progression.create(date: 20220515, done: true, participation: part1)
Progression.create(date: 20220516, done: true, participation: part1)
Progression.create(date: 20220517, done: false, participation: part1)
Progression.create(date: 20220518, done: true, participation: part1)

Progression.create(date: 20220515, done: true, participation: part2)
Progression.create(date: 20220516, done: true, participation: part2)
Progression.create(date: 20220517, done: true, participation: part2)
Progression.create(date: 20220518, done: true, participation: part2)

Progression.create(date: 20220515, done: false, participation: part3)
Progression.create(date: 20220516, done: true, participation: part3)
Progression.create(date: 20220517, done: false, participation: part3)
Progression.create(date: 20220518, done: true, participation: part3)
