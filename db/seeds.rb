# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create({email: 'presidente@hotmail.com', password: '123456', permission: 'A', user_name: 'tester1', first_name: 'Ernesto', last_name: 'Espinoza', enabled: true})
User.create({email: 'vice@hotmail.com', password: '123456', permission: 'V', user_name: 'tester2', first_name: 'Carlos', last_name: 'Salgado', enabled: true})
di_user = User.create({email: 'divulgacion@hotmail.com', password: '123456', permission: 'D', user_name: 'tester3', first_name: 'Fernando', last_name: 'Torrez', enabled: true})
User.create({email: 'invitado@hotmail.com', password: '123456', permission: 'G', user_name: 'tester4', first_name: 'Hippo', last_name: 'Maltez', enabled: true})

User.create({email: 'presidente2@hotmail.com', password: '123456', permission: 'A', user_name: 'tester5', first_name: 'Roberto Carlos', last_name: 'White', enabled: true})
User.create({email: 'vice2@hotmail.com', password: '123456', permission: 'V', user_name: 'tester6', first_name: 'Angel', last_name: 'Juarez', enabled: true})
User.create({email: 'divulgacion2@hotmail.com', password: '123456', permission: 'D', user_name: 'tester7', first_name: 'Jackson', last_name: 'Hernandez', enabled: true})
User.create({email: 'invitado2@hotmail.com', password: '123456', permission: 'G', user_name: 'tester8', first_name: 'Tamara', last_name: 'Cortez', enabled: true})

I18n.locale = :en
first_tournament = Tournament.create({international: false, name: "Latin America Men's Tournament", description: "Latin American Men's Tournament, featuring teams from Nicaragua, Guatemala, El Salvador, Costa Rica, Panama, and Honduras."})
second_tournament = Tournament.create({international: true, name: "Latin America Women's Tournament", description: "Latin American Women's Tournament, featuring teams from Nicaragua, Guatemala, El Salvador, Costa Rica, Panama, and Honduras."})
I18n.locale = :es
first_tournament.update({international: false, name: 'Torneo Latinoamerica Masculino', description: 'Torneo Latinoamericano Masculino, con equipos de Nicaragua, Guatemala, El Salvador, Costa Rica, Panama y Honduras.'})
second_tournament.update({international: true, name: 'Torneo Latinoamerica Femenino', description: 'Torneo Latinoamericano Femenino, con equipos de Nicaragua, Guatemala, El Salvador, Costa Rica, Panama y Honduras.'})

first_tournament.image.attach(io: File.open("#{Rails.root}/app/assets/images/Tournament1.png"), filename: 'Tournament1')

attach_album_image = lambda do |attachment, filename|
  File.open(Rails.root.join("app/assets/images", filename)) do |image|
    attachment.attach(io: image, filename: filename)
  end
end

men_album = Album.create!({name: "Momentos del torneo masculino", tournament_id: first_tournament.id, enabled: true})
attach_album_image.call(men_album.main_image, "juego-1.jpeg")
["leonas.jpg", "edicion.jpg", "sequia.jpg"].each do |filename|
  attach_album_image.call(men_album.images, filename)
end

women_album = Album.create!({name: "Galería del torneo femenino", tournament_id: second_tournament.id, enabled: true})
attach_album_image.call(women_album.main_image, "leonas.jpg")
["juego-1.jpeg", "edicion.jpg", "sequia.jpg"].each do |filename|
  attach_album_image.call(women_album.images, filename)
end

nicaragua_team = Team.create({
  team_name: 'Nicaragua', color_shirt1: 'Azul', color_short1: 'Blanco', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Negro', color_short3: 'Negro', delegate_name: 'Carlos Luis', delegate_last_name: 'Lopez Garcia',
  head_coach_name: 'Yanira Maria', head_coach_last_name: 'Rio Ruiz', assistant_coach1_name: 'Ruben Del Zocorro', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Claudio', assistant_coach2_last_name: 'Xu', doctor_name: 'Marcela', doctor_last_name: 'Pla Picon',
  physiotherapist_name: 'Noe', physiotherapist_last_name: 'Requena', statistical_name: 'Vanesa', statistical_last_name: 'Infante Caballero',
  international_referee_name: 'Joan', international_referee_last_name: 'Palomo',
})
nicaragua_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/Nicaragua.png"), filename: 'Nicaragua')

Player.create({
  number: 10, name: 'Juan Carlos', last_name: 'Herrera', position: 'Z', birthday: Date.new(1999, 12, 31),
  weight: 60, height: 1.70, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 8, name: 'Luis Fernando', last_name: 'Gómez', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 4, name: 'José Miguel', last_name: 'Ramírez', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 3, name: 'Carlos Alberto', last_name: 'Torres', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 14, name: 'Andrés Felipe', last_name: 'Mendoza', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 18, name: 'Miguel Ángel', last_name: 'Morales', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 6, name: 'Jorge Luis', last_name: 'Castillo', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 5, name: 'Marco Antonio', last_name: 'Ríos', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 40, name: 'Santiago David', last_name: 'Vargas', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Diego Armando', last_name: 'Salazar', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 28, name: 'Juan Manuel', last_name: 'Paredes', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 43, name: 'Pedro José', last_name: 'Navarro', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Ricardo Andrés', last_name: 'Cruz', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: nicaragua_team.id, nationality: 'Nicaragüense', gender: 'M'
})

guatemala_team = Team.create({
  team_name: 'Guatemala', color_shirt1: 'Azul', color_short1: 'Blanco', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Negro', color_short3: 'Negro', delegate_name: 'Carlos Luis', delegate_last_name: 'Lopez Garcia',
  head_coach_name: 'Yanira Maria', head_coach_last_name: 'Rio Ruiz', assistant_coach1_name: 'Ruben Del Zocorro', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Jose Pedro', assistant_coach2_last_name: 'Cordoba', doctor_name: 'Marcela', doctor_last_name: 'Pla Picon',
  physiotherapist_name: 'Noe', physiotherapist_last_name: 'Nadal', statistical_name: 'Vanesa', statistical_last_name: 'Infante Caballero',
  international_referee_name: 'Placido', international_referee_last_name: 'Morales',
})
guatemala_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/Guatemala.png"), filename: 'Guatemala')

Player.create({
  number: 10, name: 'Alejandro', last_name: 'Martínez', position: 'Z', birthday: Date.new(1999, 12, 31),
  weight: 60, height: 1.70, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 8, name: 'Juan', last_name: 'Pérez', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 4, name: 'Carlos', last_name: 'Gómez', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 3, name: 'Luis', last_name: 'Ramírez', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 14, name: 'Miguel', last_name: 'Torres', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 18, name: 'Andrés', last_name: 'Vargas', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 6, name: 'Alejandro', last_name: 'Morales', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 5, name: 'José', last_name: 'Castillos', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 40, name: 'Ricardo', last_name: 'López', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Javier', last_name: 'Mendoza', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 28, name: 'Diego', last_name: 'Navarro', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 43, name: 'Sebastián', last_name: 'Ríos', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Mateo', last_name: 'Fernández', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: guatemala_team.id, nationality: 'Nicaragüense', gender: 'M'
})

salvador_team = Team.create({
  team_name: 'El Salvador', color_shirt1: 'Azul', color_short1: 'Negro', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Cafe', color_short3: 'Azul', delegate_name: 'Mateo', delegate_last_name: 'Salazar',
  head_coach_name: 'Camila Maria', head_coach_last_name: 'Rodríguez', assistant_coach1_name: 'Diego', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Valeria', assistant_coach2_last_name: 'Gómez', doctor_name: 'Andrés', doctor_last_name: 'Vargas',
  physiotherapist_name: 'Natalia', physiotherapist_last_name: 'Castillo', statistical_name: 'Javier', statistical_last_name: 'Morales',
  international_referee_name: 'Sofía', international_referee_last_name: 'Ríos',
})
salvador_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/ElSalvador.png"), filename: 'ElSalvador')

Player.create({
  number: 10, name: 'Fernando', last_name: 'López', position: 'Z', birthday: Date.new(1999, 12, 31),
  weight: 60, height: 1.70, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 8, name: 'Santiago', last_name: 'Vargas', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 4, name: 'Marco', last_name: 'Ríos', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 3, name: 'Pedro', last_name: 'Navarro', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 14, name: 'Ricardo', last_name: 'Cruz', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 18, name: 'Ángel', last_name: 'Juárez', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 6, name: 'Roberto', last_name: 'White', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 5, name: 'Ernesto', last_name: 'Espinoza', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 40, name: 'Claudio', last_name: 'Xu', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Jackson', last_name: 'Hernández', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 28, name: 'Diego', last_name: 'Salazar', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 43, name: 'Jorge', last_name: 'Castillo', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Juan', last_name: 'Herrera', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: salvador_team.id, nationality: 'Nicaragüense', gender: 'M'
})

costarica_team = Team.create({
  team_name: 'Costa Rica', color_shirt1: 'Azul', color_short1: 'Negro', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Cafe', color_short3: 'Azul', delegate_name: 'Mateo', delegate_last_name: 'Salazar',
  head_coach_name: 'Camila Maria', head_coach_last_name: 'Rodríguez', assistant_coach1_name: 'Diego', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Valeria', assistant_coach2_last_name: 'Gómez', doctor_name: 'Andrés', doctor_last_name: 'Vargas',
  physiotherapist_name: 'Natalia', physiotherapist_last_name: 'Castillo', statistical_name: 'Javier', statistical_last_name: 'Morales',
  international_referee_name: 'Sofía', international_referee_last_name: 'Ríos',
})
costarica_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/CostaRica.png"), filename: 'CostaRica')

Player.create({
  number: 10, name: 'Rafael', last_name: 'Méndez', position: 'Z', birthday: Date.new(1999, 12, 31),
  weight: 60, height: 1.70, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 8, name: 'Tomás', last_name: 'Aguilar', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 4, name: 'Eduardo', last_name: 'Campos', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 3, name: 'Adrián', last_name: 'Silva', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 14, name: 'Nicolás', last_name: 'Ortega', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 18, name: 'Cristian', last_name: 'Flores', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 6, name: 'Pablo', last_name: 'Medina', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 5, name: 'Manuel', last_name: 'Castro', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 40, name: 'Álvaro', last_name: 'Delgado', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Bruno', last_name: 'Sánchez', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 28, name: 'Martín', last_name: 'Herrera', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 43, name: 'Emilio', last_name: 'Vargas', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Julián', last_name: 'Morales', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: costarica_team.id, nationality: 'Nicaragüense', gender: 'M'
})

panama_team = Team.create({
  team_name: 'Panama', color_shirt1: 'Azul', color_short1: 'Negro', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Cafe', color_short3: 'Azul', delegate_name: 'Mateo', delegate_last_name: 'Salazar',
  head_coach_name: 'Camila Maria', head_coach_last_name: 'Rodríguez', assistant_coach1_name: 'Diego', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Valeria', assistant_coach2_last_name: 'Gómez', doctor_name: 'Andrés', doctor_last_name: 'Vargas',
  physiotherapist_name: 'Natalia', physiotherapist_last_name: 'Castillo', statistical_name: 'Javier', statistical_last_name: 'Morales',
  international_referee_name: 'Sofía', international_referee_last_name: 'Ríos',
})
panama_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/Panama.png"), filename: 'Panama')

Player.create({
  number: 10, name: 'Antonio', last_name: 'Pérez', position: 'Z', birthday: Date.new(1999, 12, 31),
  weight: 60, height: 1.70, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 8, name: 'Gabriel', last_name: 'Torres', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 4, name: 'Francisco', last_name: 'López', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 3, name: 'Rodrigo', last_name: 'Sánchez', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 14, name: 'Vicente', last_name: 'Morales', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 18, name: 'César', last_name: 'Gómez', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 6, name: 'Adriano', last_name: 'Ramírez', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 5, name: 'Ignacio', last_name: 'Fernández', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 40, name: 'Mauricio', last_name: 'Ortega', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Simón', last_name: 'Delgado', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 28, name: 'Esteban', last_name: 'Juárez', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 43, name: 'Álvaro', last_name: 'Castillo', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Leonardo', last_name: 'Vargas', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: panama_team.id, nationality: 'Nicaragüense', gender: 'M'
})

hondura_team = Team.create({
  team_name: 'Honduras', color_shirt1: 'Azul', color_short1: 'Negro', color_shirt2: 'Blanco',
  color_short2: 'Blanco', color_shirt3: 'Cafe', color_short3: 'Azul', delegate_name: 'Mateo', delegate_last_name: 'Salazar',
  head_coach_name: 'Camila Maria', head_coach_last_name: 'Rodríguez', assistant_coach1_name: 'Diego', assistant_coach1_last_name: 'Naranjo',
  assistant_coach2_name: 'Valeria', assistant_coach2_last_name: 'Gómez', doctor_name: 'Andrés', doctor_last_name: 'Vargas',
  physiotherapist_name: 'Natalia', physiotherapist_last_name: 'Castillo', statistical_name: 'Javier', statistical_last_name: 'Morales',
  international_referee_name: 'Sofía', international_referee_last_name: 'Ríos',
})
hondura_team.image.attach(io: File.open("#{Rails.root}/app/assets/images/Honduras.png"), filename: 'Honduras')

Player.create({
  number: 10, name: 'Rafael', last_name: 'Méndez', position: 'Z', birthday: Date.new(1999, 12, 31),
  weight: 60, height: 1.70, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 8, name: 'Tomás', last_name: 'Aguilar', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 4, name: 'Eduardo', last_name: 'Campos', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 3, name: 'Adrián', last_name: 'Silva', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 14, name: 'Nicolás', last_name: 'Ortega', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 18, name: 'Cristian', last_name: 'Flores', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 6, name: 'Pablo', last_name: 'Medina', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 5, name: 'Manuel', last_name: 'Castro', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 40, name: 'Álvaro', last_name: 'Delgado', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Bruno', last_name: 'Sánchez', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 28, name: 'Martín', last_name: 'Herrera', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 43, name: 'Emilio', last_name: 'Vargas', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})
Player.create({
  number: 38, name: 'Julián', last_name: 'Morales', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: hondura_team.id, nationality: 'Nicaragüense', gender: 'M'
})

TournamentTeam.create({tournament_id: first_tournament.id, team_id: nicaragua_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: guatemala_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: panama_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: costarica_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: salvador_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: hondura_team.id})

User.create({email: 'internacional2@hotmail.com', password: '123456', permission: 'I', tournament_id: first_tournament.id, team_id: nicaragua_team.id, user_name: 'tester9', first_name: 'Maya', last_name: 'De la Cruz', enabled: true})
User.create({email: 'internacional@hotmail.com', password: '123456', permission: 'I', tournament_id: first_tournament.id, user_name: 'tester10', first_name: 'Maria Carmen', last_name: 'Martínez', enabled: true})

article_1 = Article.create({
  user_id: 3,
  title: "Leonas mantienen el primer lugar en voleibol femenino",
  description: "Las Leonas conservaron el primer lugar de la competencia tras una nueva jornada de voleibol femenino. El resultado refleja el trabajo colectivo del equipo y mantiene a Nicaragua entre las selecciones más destacadas del torneo.",
})
article_1.image.attach(io: File.open("#{Rails.root}/app/assets/images/leonas.jpg"), filename: 'Leonas')
article_1.pdf_es_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumESP.pdf"), filename: 'lorem-ipsumESP')
article_1.pdf_en_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumEN.pdf"), filename: 'lorem-ipsumEN')

article_2 = Article.create({
  user_id: di_user.id,
  title: "Se acerca, segunda edición de Liga de Voleibol Femenino en Nicaragua",
  description: "La segunda edición de la Liga de Voleibol Femenino reunirá a clubes y atletas de distintas regiones del país. La organización prepara el calendario y los detalles de participación para una temporada que busca impulsar el desarrollo del voleibol femenino nacional.",
})
article_2.image.attach(io: File.open("#{Rails.root}/app/assets/images/edicion.jpg"), filename: 'Edicion')
article_2.pdf_es_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumESP.pdf"), filename: 'lorem-ipsumESP')
article_2.pdf_en_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumEN.pdf"), filename: 'lorem-ipsumEN')

article_3 = Article.create({
  user_id: di_user.id,
  title: "Nicaragua termina sequía y se alza con el bronce",
  description: "La selección de Nicaragua obtuvo la medalla de bronce y puso fin a una etapa sin subir al podio. El resultado reconoce el esfuerzo de las atletas y el trabajo realizado durante la competencia.",
})
article_3.image.attach(io: File.open("#{Rails.root}/app/assets/images/sequia.jpg"), filename: 'sequia')
article_3.pdf_es_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumESP.pdf"), filename: 'lorem-ipsumESP')
article_3.pdf_en_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumEN.pdf"), filename: 'lorem-ipsumEN')

I18n.locale = :en
article_1.update({title: "Leonas maintain first place in women's volleyball", description: "The Leonas held on to first place after another round of women's volleyball. The result reflects the team's collective effort and keeps Nicaragua among the leading national teams in the tournament."})
article_2.update({title: "Second edition of the Women's Volleyball League in Nicaragua is approaching", description: "The second edition of the Women's Volleyball League will bring together clubs and athletes from across the country. Organizers are preparing the schedule and participation details for a season focused on developing women's volleyball in Nicaragua."})
article_3.update({title: "Nicaragua ends drought and takes bronze", description: "Nicaragua's national team won the bronze medal, ending a stretch without a podium finish. The result recognizes the athletes' effort and the work they put in throughout the competition."})
I18n.locale = :es

announcement_1 = Announcement.create({
  user_id: di_user.id,
  title: "Convocatoria a la selección nacional mayor",
  description: "La Federación Nicaragüense de Voleibol convoca a las atletas seleccionadas a presentarse al campamento nacional de preparación.\n\nLas prácticas se realizarán de lunes a viernes en el Gimnasio de Voleibol. Cada participante deberá llevar su uniforme de entrenamiento y documento de identificación."
})
announcement_1.image.attach(io: File.open("#{Rails.root}/app/assets/images/leonas.jpg"), filename: "seleccion-nacional.jpg")
announcement_1.pdf_es_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumESP.pdf"), filename: "convocatoria-seleccion-es.pdf")
announcement_1.pdf_en_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumEN.pdf"), filename: "national-team-call-en.pdf")

announcement_2 = Announcement.create({
  user_id: di_user.id,
  title: "Inscripciones abiertas para el campeonato nacional juvenil",
  description: "Se invita a clubes y asociaciones departamentales a inscribir sus equipos para el Campeonato Nacional Juvenil.\n\nLas delegaciones deben enviar la lista de jugadores y cuerpo técnico antes del cierre de inscripción. El calendario oficial se publicará una vez confirmados los equipos participantes."
})
announcement_2.image.attach(io: File.open("#{Rails.root}/app/assets/images/juego-1.jpeg"), filename: "campeonato-juvenil.jpeg")
announcement_2.pdf_es_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumESP.pdf"), filename: "inscripcion-juvenil-es.pdf")
announcement_2.pdf_en_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumEN.pdf"), filename: "youth-registration-en.pdf")

statistic_1 = Statistic.create({
  user_id: di_user.id,
  title: "Resultados de la Liga Nacional Femenina",
  description: "Resumen estadístico de la última jornada de la Liga Nacional Femenina.\n\nEl informe incluye resultados por encuentro, posiciones de los equipos y principales indicadores individuales de las jugadoras."
})
statistic_1.image.attach(io: File.open("#{Rails.root}/app/assets/images/edicion.jpg"), filename: "liga-femenina.jpg")
statistic_1.pdf_es_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumESP.pdf"), filename: "resultados-liga-es.pdf")
statistic_1.pdf_en_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumEN.pdf"), filename: "league-results-en.pdf")

statistic_2 = Statistic.create({
  user_id: di_user.id,
  title: "Balance de participación por departamento",
  description: "Este informe presenta la participación de equipos y atletas por departamento durante la temporada.\n\nLos datos permiten observar el alcance de las competencias y orientar la planificación de futuras actividades de desarrollo."
})
statistic_2.image.attach(io: File.open("#{Rails.root}/app/assets/images/tournament_ball.jpg"), filename: "participacion-departamental.jpg")
statistic_2.pdf_es_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumESP.pdf"), filename: "participacion-es.pdf")
statistic_2.pdf_en_file.attach(io: File.open("#{Rails.root}/app/assets/documents/lorem-ipsumEN.pdf"), filename: "participation-en.pdf")

I18n.locale = :en
announcement_1.update({title: "Call-up for the senior national team", description: "The Nicaraguan Volleyball Federation invites the selected athletes to attend the national training camp.\n\nPractice will take place Monday through Friday at the Volleyball Gym. Each participant should bring training gear and identification."})
announcement_2.update({title: "Registration open for the national youth championship", description: "Clubs and departmental associations are invited to register their teams for the National Youth Championship.\n\nDelegations must submit their player and coaching staff lists before registration closes. The official schedule will be published once participating teams are confirmed."})
statistic_1.update({title: "National Women's League results", description: "Statistical summary of the latest round of the National Women's League.\n\nThe report includes match results, team standings, and key individual indicators for the athletes."})
statistic_2.update({title: "Participation report by department", description: "This report presents team and athlete participation by department during the season.\n\nThe data shows the reach of the competitions and supports planning for future development activities."})
I18n.locale = :es

calendar_nicaragua_guatemala = Calendar.create!({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) - 3.days, team1: nicaragua_team.id, team2: guatemala_team.id, status: 'T', description: 'Partido inaugural del torneo'})
calendar_nicaragua_salvador = Calendar.create!({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) - 2.days, team1: nicaragua_team.id, team2: salvador_team.id, status: 'T', description: 'Partido jugado en el estadio nacional'})
calendar_nicaragua_costarica = Calendar.create!({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) - 1.day, team1: nicaragua_team.id, team2: costarica_team.id, status: 'T', description: 'Nicaragua vs Costa Rica'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) + 4.days, team1: nicaragua_team.id, team2: panama_team.id, description: 'Primer partido en las canchas de la ciudad'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) + 5.days, team1: nicaragua_team.id, team2: hondura_team.id, description: 'Partido partrociannado por VISA'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) + 6.days, team1: guatemala_team.id, team2: salvador_team.id, description: 'Guatemala vs El Salvador'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) + 7.days, team1: guatemala_team.id, team2: costarica_team.id, description: 'Partido patrocinado por Allianz'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 10, min: 0, sec: 0) + 8.days, team1: guatemala_team.id, team2: panama_team.id, description: 'Feliz Cumpleaños a Carlos Gutiérrez'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 13, min: 0, sec: 0) + 8.days, team1: guatemala_team.id, team2: hondura_team.id, description: 'Mitad de la segunda ronda del torneo'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 13, min: 0, sec: 0) + 7.days, team1: salvador_team.id, team2: costarica_team.id, description: 'Ultimo partido de Jose Martínez'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 13, min: 0, sec: 0) + 6.days, team1: salvador_team.id, team2: panama_team.id, description: 'El Salvador vs Panama'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 13, min: 0, sec: 0) + 5.days, team1: salvador_team.id, team2: hondura_team.id, description: 'Con la colaboracion de la federación de voleibol'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 13, min: 0, sec: 0) + 4.days, team1: costarica_team.id, team2: panama_team.id, description: 'Con la colaboración de Claro'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 13, min: 0, sec: 0) + 3.days, team1: costarica_team.id, team2: hondura_team.id, description: 'Primer partido del jugador mas joven del torneo'})
Calendar.create({tournament_id: first_tournament.id, start_date_time: Time.current.change(hour: 13, min: 0, sec: 0) + 2.days, team1: panama_team.id, team2: hondura_team.id, description: 'Finalización de la etapa de clasificación'})

# Resultados de prueba vinculados al calendario y sus acciones por set.
game_nicaragua_guatemala = Game.create!({
  calendar: calendar_nicaragua_guatemala, user: di_user,
  winning_team: nicaragua_team.id, win_score: 3, lose_team: guatemala_team.id, lose_score: 1,
  description: 'Nicaragua se impuso en cuatro sets.'
})
game_nicaragua_salvador = Game.create!({
  calendar: calendar_nicaragua_salvador, user: di_user,
  winning_team: salvador_team.id, win_score: 3, lose_team: nicaragua_team.id, lose_score: 2,
  description: 'El Salvador ganó un partido disputado hasta el quinto set.'
})
game_nicaragua_costarica = Game.create!({
  calendar: calendar_nicaragua_costarica, user: di_user,
  winning_team: nicaragua_team.id, win_score: 3, lose_team: costarica_team.id, lose_score: 0,
  description: 'Nicaragua ganó el encuentro en sets corridos.'
})

[
  [game_nicaragua_guatemala, nicaragua_team, nicaragua_team.players.find_by(number: 10), 'T', 1, 1, 'Ataque ganador de Nicaragua'],
  [game_nicaragua_guatemala, guatemala_team, guatemala_team.players.find_by(number: 8), 'B', 2, 2, 'Bloqueo de Guatemala'],
  [game_nicaragua_guatemala, nicaragua_team, nicaragua_team.players.find_by(number: 4), 'T', 3, 3, 'Punto de ataque para cerrar el partido'],
  [game_nicaragua_salvador, salvador_team, salvador_team.players.find_by(number: 10), 'T', 1, 1, 'Ataque de El Salvador'],
  [game_nicaragua_salvador, nicaragua_team, nicaragua_team.players.find_by(number: 8), 'R', 3, 2, 'Recepción y contraataque de Nicaragua'],
  [game_nicaragua_salvador, salvador_team, salvador_team.players.find_by(number: 4), 'T', 5, 3, 'Punto decisivo del quinto set'],
  [game_nicaragua_costarica, nicaragua_team, nicaragua_team.players.find_by(number: 14), 'B', 1, 1, 'Bloqueo de Nicaragua'],
  [game_nicaragua_costarica, costarica_team, costarica_team.players.find_by(number: 8), 'E', 2, 2, 'Error de saque de Costa Rica'],
  [game_nicaragua_costarica, nicaragua_team, nicaragua_team.players.find_by(number: 3), 'T', 3, 3, 'Último ataque del encuentro']
].each do |game, team, player, detail_type, number_set, order, description|
  GameDetail.create!(
    game: game, team_id: team.id, player_id: player&.id, detail_type: detail_type,
    number_set: number_set, order: order, description: description
  )
end
