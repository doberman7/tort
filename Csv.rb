class Person
  attr_accessor :first_name, :last_name, :email, :phone,:created_at
  #@@n_persons = 10
  def initialize
    

  end
  def creater(n_persons)
    container = []
    n_persons.times do
      container << Person.new
    end
    container
  end
end

instancia = Person.new
p instancia.creater(10)
