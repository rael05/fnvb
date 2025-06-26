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
first_tournament = Tournament.create({international: false, name: "Latin America Men's Tournament", description: "Latin American Men's Tournament, featuring teams from Nicaragua, Guatemala, El Salvador, Costa Rica, Panama, and Honduras."})
second_tournament = Tournament.create({international: true, name: "Latin America Women's Tournament", description: "Latin American Women's Tournament, featuring teams from Nicaragua, Guatemala, El Salvador, Costa Rica, Panama, and Honduras."})
I18n.locale = :es
first_tournament.update({international: false, name: 'Torneo Latinoamerica Masculino', description: 'Torneo Latinoamericano Masculino, con equipos de Nicaragua, Guatemala, El Salvador, Costa Rica, Panama y Honduras.'})
second_tournament.update({international: true, name: 'Torneo Latinoamerica Femenino', description: 'Torneo Latinoamericano Femenino, con equipos de Nicaragua, Guatemala, El Salvador, Costa Rica, Panama y Honduras.'})

first_tournament.image.attach(io: File.open("#{Rails.root}/app/assets/images/Tournament1.png"), filename: 'Tournament1')

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
  weight: 60, height: 1.70, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 8, name: 'Luis Fernando', last_name: 'Gómez', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 4, name: 'José Miguel', last_name: 'Ramírez', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 3, name: 'Carlos Alberto', last_name: 'Torres', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 14, name: 'Andrés Felipe', last_name: 'Mendoza', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 18, name: 'Miguel Ángel', last_name: 'Morales', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 6, name: 'Jorge Luis', last_name: 'Castillo', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 5, name: 'Marco Antonio', last_name: 'Ríos', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 40, name: 'Santiago David', last_name: 'Vargas', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Diego Armando', last_name: 'Salazar', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 28, name: 'Juan Manuel', last_name: 'Paredes', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 43, name: 'Pedro José', last_name: 'Navarro', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Ricardo Andrés', last_name: 'Cruz', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: nicaragua_team.id, nationality: 'Nicaragüense'
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
  weight: 60, height: 1.70, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 8, name: 'Juan', last_name: 'Pérez', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 4, name: 'Carlos', last_name: 'Gómez', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 3, name: 'Luis', last_name: 'Ramírez', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 14, name: 'Miguel', last_name: 'Torres', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 18, name: 'Andrés', last_name: 'Vargas', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 6, name: 'Alejandro', last_name: 'Morales', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 5, name: 'José', last_name: 'Castillos', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 40, name: 'Ricardo', last_name: 'López', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Javier', last_name: 'Mendoza', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 28, name: 'Diego', last_name: 'Navarro', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 43, name: 'Sebastián', last_name: 'Ríos', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: guatemala_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Mateo', last_name: 'Fernández', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: guatemala_team.id, nationality: 'Nicaragüense'
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
  weight: 60, height: 1.70, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 8, name: 'Santiago', last_name: 'Vargas', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 4, name: 'Marco', last_name: 'Ríos', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 3, name: 'Pedro', last_name: 'Navarro', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 14, name: 'Ricardo', last_name: 'Cruz', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 18, name: 'Ángel', last_name: 'Juárez', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 6, name: 'Roberto', last_name: 'White', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 5, name: 'Ernesto', last_name: 'Espinoza', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 40, name: 'Claudio', last_name: 'Xu', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Jackson', last_name: 'Hernández', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 28, name: 'Diego', last_name: 'Salazar', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 43, name: 'Jorge', last_name: 'Castillo', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: salvador_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Juan', last_name: 'Herrera', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: salvador_team.id, nationality: 'Nicaragüense'
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
  weight: 60, height: 1.70, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 8, name: 'Tomás', last_name: 'Aguilar', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 4, name: 'Eduardo', last_name: 'Campos', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 3, name: 'Adrián', last_name: 'Silva', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 14, name: 'Nicolás', last_name: 'Ortega', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 18, name: 'Cristian', last_name: 'Flores', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 6, name: 'Pablo', last_name: 'Medina', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 5, name: 'Manuel', last_name: 'Castro', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 40, name: 'Álvaro', last_name: 'Delgado', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Bruno', last_name: 'Sánchez', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 28, name: 'Martín', last_name: 'Herrera', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 43, name: 'Emilio', last_name: 'Vargas', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: costarica_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Julián', last_name: 'Morales', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: costarica_team.id, nationality: 'Nicaragüense'
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
  weight: 60, height: 1.70, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 8, name: 'Gabriel', last_name: 'Torres', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 4, name: 'Francisco', last_name: 'López', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 3, name: 'Rodrigo', last_name: 'Sánchez', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 14, name: 'Vicente', last_name: 'Morales', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 18, name: 'César', last_name: 'Gómez', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 6, name: 'Adriano', last_name: 'Ramírez', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 5, name: 'Ignacio', last_name: 'Fernández', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 40, name: 'Mauricio', last_name: 'Ortega', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Simón', last_name: 'Delgado', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 28, name: 'Esteban', last_name: 'Juárez', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 43, name: 'Álvaro', last_name: 'Castillo', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: panama_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Leonardo', last_name: 'Vargas', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: panama_team.id, nationality: 'Nicaragüense'
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
  weight: 60, height: 1.70, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 8, name: 'Tomás', last_name: 'Aguilar', position: 'S', birthday: Date.new(1997, 11, 30),
  weight: 80, height: 1.63, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 4, name: 'Eduardo', last_name: 'Campos', position: 'Z', birthday: Date.new(2000, 07, 28),
  weight: 90, height: 1.80, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 3, name: 'Adrián', last_name: 'Silva', position: 'R', birthday: Date.new(1994, 04, 13),
  weight: 70, height: 1.78, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 14, name: 'Nicolás', last_name: 'Ortega', position: 'L', birthday: Date.new(1995, 12, 31),
  weight: 87, height: 1.83, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 18, name: 'Cristian', last_name: 'Flores', position: 'R', birthday: Date.new(2002, 05, 04),
  weight: 68, height: 1.84, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 6, name: 'Pablo', last_name: 'Medina', position: 'Z', birthday: Date.new(2001, 03, 23),
  weight: 68, height: 1.85, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 5, name: 'Manuel', last_name: 'Castro', position: 'R', birthday: Date.new(1998, 02, 06),
  weight: 89, height: 1.70, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 40, name: 'Álvaro', last_name: 'Delgado', position: 'S', birthday: Date.new(1995, 02, 11),
  weight: 87, height: 1.74, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Bruno', last_name: 'Sánchez', position: 'S', birthday: Date.new(1993, 04, 21),
  weight: 79, height: 1.81, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 28, name: 'Martín', last_name: 'Herrera', position: 'L', birthday: Date.new(2003, 07, 12),
  weight: 77, height: 1.83, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 43, name: 'Emilio', last_name: 'Vargas', position: 'A', birthday: Date.new(1996, 05, 17),
  weight: 88, height: 1.78, team_id: hondura_team.id, nationality: 'Nicaragüense'
})
Player.create({
  number: 38, name: 'Julián', last_name: 'Morales', position: 'Z', birthday: Date.new(1998, 07, 13),
  weight: 69, height: 1.78, team_id: hondura_team.id, nationality: 'Nicaragüense'
})

TournamentTeam.create({tournament_id: first_tournament.id, team_id: nicaragua_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: guatemala_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: panama_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: costarica_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: salvador_team.id})
TournamentTeam.create({tournament_id: first_tournament.id, team_id: hondura_team.id})

User.create({email: 'internacional2@hotmail.com', password: '123456', permission: 'I', tournament_id: first_tournament.id, team_id: nicaragua_team.id, user_name: 'tester9', first_name: 'Maya', last_name: 'De la Cruz'})
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
Calendar.create({tournament_id: first_tournament.id, team1: nicaragua_team.id, team2: guatemala_team.id, stage: "C", start_date_time: DateTime.now, status: "P", description: "Primer juego del primer torneo"})
Calendar.create({tournament_id: first_tournament.id, team1: nicaragua_team.id, team2: guatemala_team.id, stage: "C", start_date_time: DateTime.now + 1.days, status: "P", description: "Segundo juego del primer torneo"})