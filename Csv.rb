require 'faker'#requerir la libreria faker, usada en METODO creater_people
require 'csv'#requerir la libreria csv, usada en METODO create_csv
class Person
  attr_reader :first_name, :last_name, :email, :phone,:created_at
  def initialize(first_name, last_name, email, phone, created_at)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end
end

#Crear un método que reciba como argumento el número de personas que quieres crear. Y regrese las personas en un arreglo.
def creater_people(n_persons)#METODO fuera del scope de class Person
  container = []
  n_persons.times do
    container << Person.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::PhoneNumber.phone_number, Faker::Time.backward(14, :evening))#
  end
  container
end

class PersonWriter#crea una clase que tendrá como responsabilidad crear archivos CSV
  def initialize(file, array)
    @file = file
    @array = array
  end
  #Método que reciba un array y por cada elemento cree una línea en el archivo CSV.
  def create_csv
    CSV.open(@file, "w+") do |line_in_csv|#open(fd, mode="r" [, opt]) { |io| block } → obj   El "w+" es "Read-write",
         @array.each do |person|#itera sobre el arreglo contruido en el METODO creater_people
           line_in_csv << [person.first_name, person.last_name, person.email, person.phone, person.created_at]
         end
      end
  end
end

class PersonParser
  def initialize(file)
    @file = file
  end
  def people
      array_for_lines =[]
      counter = 0
      #ARCHIVO.foreach(path,  &block)
      CSV.foreach(@file) do |line_csv_instanc|#leer el archivo que creaste en el paso anterior
      array_for_lines << Person.new(line_csv_instanc[0],line_csv_instanc[1],line_csv_instanc[2],line_csv_instanc[3],line_csv_instanc[4])#crea una instancia de la clase Person, Por cada línea del archivo, #guárdalas en un arreglo.
      puts line_csv_instanc unless counter >= 10 #Muestra en la pantalla las primeras diez personas del archivo
      counter += 1
      end
      array_for_lines
  end

end
#Modifica algunas de las personas del arreglo y vuelve a salvar el archivo con estos cambios.
def modif(file,arr)
  rand(arr.length - 1).times do
    arr[rand(arr.length-1)] = Person.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::PhoneNumber.phone_number, Faker::Time.backward(14, :evening))#
  end
  CSV.open(file, "wb") do |csv|
    arr.each do |ar_i|
      p csv << [ar_i]
    end
  end
end

people = creater_people(10)#asignar resultado del metodo creater_people
person_writer = PersonWriter.new("people.csv", people)# crear objetop
person_writer.create_csv

parser = PersonParser.new('people.csv')
people = parser.people

#modif('people.csv',people)
