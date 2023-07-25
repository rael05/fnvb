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

User.create({email: 'presidente2@hotmail.com', password: '123456', permission: 'A'})
User.create({email: 'vice2@hotmail.com', password: '123456', permission: 'V'})
User.create({email: 'internacional2@hotmail.com', password: '123456', permission: 'I'})
User.create({email: 'divulgacion2@hotmail.com', password: '123456', permission: 'D'})
User.create({email: 'invitado2@hotmail.com', password: '123456', permission: 'G'})

I18n.locale = :en
first_tournament = Tournament.create({international: false, name: 'First Tournament', description: 'description of the first tournament'})
second_tournament = Tournament.create({international: true, name: 'Second Tournament', description: 'description of the second tournament'})
I18n.locale = :es
first_tournament.update({name: 'Primer Torneo', description: 'descripción del primer torneo'})
second_tournament.update({name: 'Segundo Torneo', description: 'descripción del segundo torneo'})

Team.create({
  tournament_id: first_tournament.id, team_name: 'Nicaragua', color_shirt1: 'Azul', color_short1: 'Blanco', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Negro', color_short3: 'Negro', delegate_name: 'Carlos Luis', delegate_last_name: 'Lopez Garcia',
  head_coach_name: 'Yanira Maria', head_coach_last_name: 'Rio Ruiz', assistant_coach1_name: 'Ruben Del Zocorro', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Claudio', assistant_coach2_last_name: 'Cordoba', doctor_name: 'Marcela', doctor_last_name: 'Pla Picon',
  physiotherapist_name: 'Noe', physiotherapist_last_name: 'Nadal', statistical_name: 'Vanesa', statistical_last_name: 'Infante Caballero',
  international_referee_name: 'Leticia', international_referee_last_name: 'Luque',
})
