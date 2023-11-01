# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create({email: 'presidente@hotmail.com', password: '123456', permission: 'A', user_name: 'tester1'})
User.create({email: 'vice@hotmail.com', password: '123456', permission: 'V', user_name: 'tester2'})
di_user = User.create({email: 'divulgacion@hotmail.com', password: '123456', permission: 'D', user_name: 'tester3'})
User.create({email: 'invitado@hotmail.com', password: '123456', permission: 'G', user_name: 'tester4'})

User.create({email: 'presidente2@hotmail.com', password: '123456', permission: 'A', user_name: 'tester5'})
User.create({email: 'vice2@hotmail.com', password: '123456', permission: 'V', user_name: 'tester6'})
User.create({email: 'divulgacion2@hotmail.com', password: '123456', permission: 'D', user_name: 'tester7'})
User.create({email: 'invitado2@hotmail.com', password: '123456', permission: 'G', user_name: 'tester8'})

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
  assistant_coach2_name: 'Claudio', assistant_coach2_last_name: 'Cordoba', doctor_name: 'Marcela', doctor_last_name: 'Pla Picon',
  physiotherapist_name: 'Noe', physiotherapist_last_name: 'Nadal', statistical_name: 'Vanesa', statistical_last_name: 'Infante Caballero',
  international_referee_name: 'Leticia', international_referee_last_name: 'Luque',
})

TournamentTeam.create({tournament_id: first_tournament.id, team_id: first_team.id})

User.create({email: 'internacional2@hotmail.com', password: '123456', permission: 'I', tournament_id: first_tournament.id, team_id: first_team.id, user_name: 'tester9'})
User.create({email: 'internacional@hotmail.com', password: '123456', permission: 'I', tournament_id: first_tournament.id, user_name: 'tester10'})

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
