# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

opsAnalyst = Position.create(title: "Ops Analyst")
marketer = Position.create(title: "Marketer")

will = position.users.create(username: "willee", first_name: "Will", last_name: "Lee")

sebby = marketer.users.create(username: "sebby", first_name: "Sebastian", last_name: "Lee")