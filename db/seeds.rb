# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create({email: 'presidente@hotmail.com', password: '123456', permission: 'A', user_name: 'tester1', first_name: 'Ernesto', last_name: 'Espinoza'})
User.create({email: 'vice@hotmail.com', password: '123456', permission: 'V', user_name: 'tester2', first_name: 'Carlos', last_name: 'Salgado'})
di_user = User.create({email: 'divulgacion@hotmail.com', password: '123456', permission: 'D', user_name: 'tester3', first_name: 'Fernando', last_name: 'Torrez'})
User.create({email: 'invitado@hotmail.com', password: '123456', permission: 'G', user_name: 'tester4', first_name: 'Hippo', last_name: 'Maltez'})

User.create({email: 'presidente2@hotmail.com', password: '123456', permission: 'A', user_name: 'tester5', first_name: 'Roberto Carlos', last_name: 'White' })
User.create({email: 'vice2@hotmail.com', password: '123456', permission: 'V', user_name: 'tester6', first_name: 'Angel', last_name: 'Juarez'})
User.create({email: 'divulgacion2@hotmail.com', password: '123456', permission: 'D', user_name: 'tester7', first_name: 'Jackson', last_name: 'Hernandez'})
User.create({email: 'invitado2@hotmail.com', password: '123456', permission: 'G', user_name: 'tester8', first_name: 'Tamara', last_name: 'Cortez'})

I18n.locale = :en
first_tournament = Tournament.create({international: false, name: 'First Tournament', description: 'description of the first tournament'})
second_tournament = Tournament.create({international: true, name: 'Second Tournament', description: 'description of the second tournament'})
I18n.locale = :es
first_tournament.update({name: 'Primer Torneo', description: 'descripción del primer torneo'})
second_tournament.update({name: 'Segundo Torneo', description: 'descripción del segundo torneo'})

first_team = Team.create({
  team_name: 'Nicaragua', color_shirt1: 'Azul', color_short1: 'Blanco', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Negro', color_short3: 'Negro', delegate_name: 'Carlos Luis', delegate_last_name: 'Lopez Garcia',
  head_coach_name: 'Yanira Maria', head_coach_last_name: 'Rio Ruiz', assistant_coach1_name: 'Ruben Del Zocorro', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Claudio', assistant_coach2_last_name: 'Xu', doctor_name: 'Marcela', doctor_last_name: 'Pla Picon',
  physiotherapist_name: 'Noe', physiotherapist_last_name: 'Requena', statistical_name: 'Vanesa', statistical_last_name: 'Infante Caballero',
  international_referee_name: 'Joan', international_referee_last_name: 'Palomo',
})
first_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/Nicaragua.png"), filename: 'Nicaragua')

Player.create!({
  number: 10, name: 'Juan Carlos', last_name: 'Herrera', position: 'Z', birthday: Date.new(1999, 12, 31),
  weight: 60, height: 1.70, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 8, name: 'Luis Fernando', last_name: 'Gómez', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 4, name: 'José Miguel', last_name: 'Ramírez', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 3, name: 'Carlos Alberto', last_name: 'Torres', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 14, name: 'Andrés Felipe', last_name: 'Mendoza', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 18, name: 'Miguel Ángel', last_name: 'Morales', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 6, name: 'Jorge Luis', last_name: 'Castillo', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 5, name: 'Marco Antonio', last_name: 'Ríos', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 40, name: 'Santiago David', last_name: 'Vargas', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 38, name: 'Diego Armando', last_name: 'Salazar', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 28, name: 'Juan Manuel', last_name: 'Paredes', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 43, name: 'Pedro José', last_name: 'Navarro', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: first_team.id, nationality: 'Nicaragüense'
})
Player.create!({
  number: 38, name: 'Ricardo Andrés', last_name: 'Cruz', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: first_team.id, nationality: 'Nicaragüense'
})

second_team = Team.create({
  team_name: 'Guatemala', color_shirt1: 'Azul', color_short1: 'Blanco', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Negro', color_short3: 'Negro', delegate_name: 'Carlos Luis', delegate_last_name: 'Lopez Garcia',
  head_coach_name: 'Yanira Maria', head_coach_last_name: 'Rio Ruiz', assistant_coach1_name: 'Ruben Del Zocorro', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Jose Pedro', assistant_coach2_last_name: 'Cordoba', doctor_name: 'Marcela', doctor_last_name: 'Pla Picon',
  physiotherapist_name: 'Noe', physiotherapist_last_name: 'Nadal', statistical_name: 'Vanesa', statistical_last_name: 'Infante Caballero',
  international_referee_name: 'Placido', international_referee_last_name: 'Morales',
})
second_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/Guatemala.png"), filename: 'Guatemala')

TournamentTeam.create({tournament_id: first_tournament.id, team_id: first_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: second_team.id})
User.create!({email: 'internacional2@hotmail.com', password: '123456', permission: 'I', tournament_id: first_tournament.id, team_id: first_team.id, user_name: 'tester9', first_name: 'Maya', last_name: 'De la Cruz'})
User.create({email: 'internacional@hotmail.com', password: '123456', permission: 'I', tournament_id: first_tournament.id, user_name: 'tester10', first_name: 'Maria Carmen', last_name: 'Martínez'})

article_1 = Article.create({
  user_id: 3,
  title: "Leonas mantienen el primer lugar en voleibol femenino",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
})
article_1.image.attach(io: File.open("#{Rails.root}/app/assets/images/leonas.jpg"), filename: 'Leonas')

article_2 = Article.create({
  user_id: di_user.id,
  title: "Se acerca, segunda edición de Liga de Voleibol Femenino en Nicaragua",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
})
article_2.image.attach(io: File.open("#{Rails.root}/app/assets/images/edicion.jpg"), filename: 'Edicion')

article_3 = Article.create({
  user_id: di_user.id,
  title: "Nicaragua termina sequía y se alza con el bronce",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
})
article_3.image.attach(io: File.open("#{Rails.root}/app/assets/images/sequia.jpg"), filename: 'sequia')
Calendar.create({tournament_id: first_tournament.id, team1: first_team.id, team2: second_team.id, stage: "C", start_date_time: DateTime.now, status: "P", description: "Primer juego del primer torneo"})
Calendar.create({tournament_id: first_tournament.id, team1: first_team.id, team2: second_team.id, stage: "C", start_date_time: DateTime.now + 1.days, status: "P", description: "Segundo juego del primer torneo"})