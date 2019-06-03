# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

opsAnalyst = Position.create(title: "Ops Analyst")
marketer = Position.create(title: "Marketer")
teamLead = Position.create(title: "Team Lead")

will = opsAnalyst.users.create(username: "willee", first_name: "Will", last_name: "Lee", password: "password")

karen = teamLead.users.create(username: "ktang", first_name: "Karen", last_name: "Tang", password: "password")

sebby = marketer.users.create(username: "sebby", first_name: "Sebastian", last_name: "Lee", password: "password")

dan = marketer.users.create(username: "danny", first_name: "Dan", last_name: "TheMan", password: "password")

will.save
karen.save
sebby.save

grant = Project.create(title: "Grant Application - NYC")

granttask1 = grant.tasks.create(title:"Formulate problem", content: "what is this going to be about -- need to have meetings...", user_id: karen.id)

granttask2 = grant.tasks.create(title:"Find papers", content: "scour libraries", user_id: karen.id)

granttask3 = grant.tasks.create(title:"Draft stakeholders", content: "talk to people", user_id: sebby.id)

granttask4 = grant.tasks.create(title:"Draft paper", content: "draft", user_id: will.id)

granttask1.save
granttask2.save
granttask3.save
granttask4.save