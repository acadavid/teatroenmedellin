# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

theaters = Theater.create(
  [
    {name: 'Teatro Metropolitano', description: 'Medellín Cultural es una Asociación sin ánimo de lucro, dedicada desde 1975 a fomentar la cultura mediante la proyección y la difusión de diversas manifestaciones artísticas de carácter local, nacional e internacional.', website: 'http://www.teatrometropolitano.com/'},
    {name: 'Teatro Matacandelas', description: 'La Asociación Colectivo Teatral Matacandelas es una entidad sin ánimo de lucro creada en el año de 1979 y elevada a la categoría de Patrimonio Cultural de la Ciudad de Medellín en 1991. En sus 34 años de existencia ha producido más de 50 montajes, entre ellos unos 12 pertenecientes al teatro de títeres.', website: 'www.matacandelas.com', email: 'matacandelas@matacandelas.com' },
    {name: 'Pequeño Teatro', description: 'Desde 1987, la Asociación PEQUEÑO TEATRO cuenta con una sede propia en la cual funcionan sus actividades artísticas y  administrativas. Es una casona de arquitectura republicana de finales del Siglo XIX, ubicada en el centro de la ciudad (Córdoba x La Playa) y declarada Patrimonio Arquitectónico y Cultural de Medellín.', website: 'http://pequenoteatro.com/'},
    {name: 'Teatro Universidad de Medellín', description: 'El Teatro de la Universidad de Medellín, Gabriel Obregón Botero, es un escenario perfecto para la realización de espectáculos y eventos y se perfila como el Teatro de mayor calidad y avances tecnológicos en la ciudad de Medellín, cuenta con una acústica inigualable, excelente visibilidad desde cualquier punto de la sala y una dotación que pondrá sonido y colorido a sus eventos. Nuestro equipo humano y técnico brinda un acompañamiento de principio a fin a instituciones, empresarios y particulares, garantizando un evento de calidad memorable.', website: 'http://www.udem.edu.co/index.php/servicios/teatro'}
  ]
)

venues = Venue.create(
  [
    {name: 'Metropolitano', city: 'Medellín', address: 'Calle 41 No. 57 - 30', phone: '(57) (4) 232 2858', theater: theaters.first},
    {name: 'Matacandelas', city: 'Medellín', address: 'Calle 47 No. 43 - 47', phone: '(57) (4) 215 10 10', theater: theaters[1]},
    {name: 'Pequeño', city: 'Medellín', address: 'Carrera 42 No. 50 A 12 (Córdoba con La Playa)', phone: '(57) (4) 239 3947', theater: theaters[2]},
    {name: 'UdeM', city: 'Medellín', address: 'Carrera 87 N° 30 - 65', phone: '(57) (4) 340 52 02', theater: theaters.last}
  ]
)

acts = Act.create(
  [
    { 
      name: 'Noche de Navidad en Concierto !Cenicienta!', 
      description: 'El mágico cuento de los hermanos Grimm alegre, musical, humorístico.', 
      clasification: '7+',
      price: 30000.00, 
      theater: theaters[1], 
      venue: venues[1]
    },
    { 
      name: 'Inspirations Festival', 
      description: 'Fiesta Heavy - Glam en vivo.', 
      clasification: '18+',
      price: 50000.00, 
      theater: theaters[1],
      venue: venues[1]
    },
    { 
      name: 'Concierto de villancicos con arreglos del maestro Jaime Cháves', 
      description: 'Los más tradicionales villancicos con arreglos del maestro Jaime Cháves, con sabor a jazz, salsa, cumbia y joropo, acompañados por los Tres Reyes Magos que interactúan con el público. El recital instala la lúdica y la participación con dos presentadores comediantes.', 
      clasification: '4+',
      price: 0, 
      theater: theaters.last, 
      venue: venues.last
    },
  ]
)

ActDate.create(date: Date.yesterday, act: acts.first)
ActDate.create(date: Date.today, act: acts[1])
ActDate.create(date: Date.tomorrow, act: acts[1])
ActDate.create(date: Date.tomorrow+1, act: acts[1])
ActDate.create(date: Date.today, act: acts.last)
ActDate.create(date: Date.tomorrow, act: acts.last)