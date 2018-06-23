# frozen_string_literal: true

a = ['Escoge una opcion.', '1. Nombre de los alumno y su promedio de notas.', '2. Nombre del los alumnos y sus inasistencias.', '3. Nombre de los alumnos aprobados segun su criterio.', '4, Salir']

def nombre_promedio
  personas = []
  File.open('notas_alumnos.csv', 'r') { |file| personas = file.readlines.map(&:chomp) }
  alumnos_con_notas = personas.map { |datos| datos.split(', ') }
  # print alumnos_con_notas

  alumnos_con_notas.each do |informacion|
    suma = 0
    informacion.each do |uno_por_uno|
      suma += uno_por_uno.to_f
    end

    promedio = suma / (informacion.length - 1)
    puts "#{informacion[0]}| El promedio de notas de alumno es de: #{promedio}"

    filename = "#{informacion[0]}.txt"
    file2 = File.open(filename, 'w')
    file2.puts "Nombre del alumno: #{informacion[0]}| y Promedio de notas: #{promedio}"
    file2.close
  end
end

def inasistencias
  personas = []
  File.open('notas_alumnos.csv', 'r') { |file| personas = file.readlines.map(&:chomp) }

  personas.each do |informacion|
    data = informacion.split(', ')
    inasis = informacion.split('')
    nombre = data[0]
    faltas = inasis.count('A')
    puts "#{nombre}| Las inasistencias del alumno es de: #{faltas}"
  end
end

def alumnos_aprobados
  personas = []
  File.open('notas_alumnos.csv', 'r') { |file| personas = file.readlines.map(&:chomp) }
  alumnos_con_notas = personas.map { |datos| datos.split(', ') }

  promedio = 0
  nombre = 0
  puts 'Escribe la nota con la cual los alumnos aprobaran'
  puts ''
  c = gets.chomp.to_f

  alumnos_con_notas.each do |informacion|
    promedio = 0
    suma = 0

    informacion.each do |uno_por_uno|
      suma += uno_por_uno.to_f
    end

    nombre = informacion[0]
    promedio = suma / (informacion.length - 1)

    if c == 0
      puts "Alumnos aprobados con nota mayor o igual a 5| #{nombre}|  Promedio: #{promedio}" if promedio >= 5
    elsif c <= promedio
      puts "Alumnos aprobados con nota mayor o igual a #{c}| #{nombre}|   Promedio: #{promedio}"
    end
  end
  end

eleccion = 0
while  eleccion != 4
  puts '#----------------------------------------------------------------------------#'
  puts a
  puts '#----------------------------------------------------------------------------#'

  eleccion = gets.chomp.to_f
  case eleccion
  when 1
    nombre_promedio

  when 2
    inasistencias

  when 3
    alumnos_aprobados

  when 4
    puts '#----------------------------------------------------------------------------#'
    puts 'Un gusto hacerla la vida mas simple.'
    puts '#----------------------------------------------------------------------------#'
  else
    puts '#----------------------------------------------------------------------------#'
    puts 'Opción incorrecta.'
    puts '#----------------------------------------------------------------------------#'
   end
end
