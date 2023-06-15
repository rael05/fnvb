# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create({email: 'presidente@hotmail.com', password: '123456', permission: 'A'})
User.create({email: 'vice@hotmail.com', password: '123456', permission: 'V'})
User.create({email: 'internacional@hotmail.com', password: '123456', permission: 'I'})
User.create({email: 'divulgacion@hotmail.com', password: '123456', permission: 'D'})
User.create({email: 'invitado@hotmail.com', password: '123456', permission: 'G'})

I18n.locale = :en
first_tournament = Tournament.create({international: false, name: 'First Tournament', description: 'description of the first tournament'})
second_tournament = Tournament.create({international: true, name: 'Second Tournament', description: 'description of the second tournament'})
I18n.locale = :es
first_tournament.update({name: 'Primer Torneo', description: 'descripción del primer torneo'})
second_tournament.update({name: 'Segundo Torneo', description: 'descripción del segundo torneo'})
