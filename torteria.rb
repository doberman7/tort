=begin
¿Qué clases crees que sean necesarias? TORTAS HORNO
¿Qué atributos deben tener las clases?
  TORTAS: tipo tiempo
  HORNO: tiempo
¿Cuál es el comportamiento necesario para cada una?
  TORTAS: cruda, casi lista, lista y quemada.
  HORNO: tiempo
¿Cómo van a interactuar las clases entre ellas?
  Dado el tiempo de de cocciòn en el horno el estado de la torta cambiara
¿Cómo divides el código para que cada clase y método tenga una única responsabilidad?
  en tortas, horno
¿cómo puedes hacer para meter varias tortas con tiempos diferentes de horneado?
  ordenar ascendentemente las tortas dependiendo del tiempo de coccion
	extraer en ese orden
Implementa una manera para saber en que etapa del horneado se encuentra cada tipo de torta.
Puedes usar los siguientes estados: crudo, casi listo, listo y quemado.
=end

=begin
Necesita preparar diferentes tipos de tortas.
Necesita meter las tortas por lotes al horno.
Y lo más importante saber cuando sacarlas.
objetivo es manipular objetos tortas
=end
class Tortas
	attr_reader :tipo , :tiempo_coccion
	def initialize(tipo, tiempo_coccion)
		@tipo = tipo
		@tiempo_coccion = tiempo_coccion
	end
end

class Horno
	attr_accessor :estado

	def initialize(array_de_tortas)
		@array_de_tortas = array_de_tortas
	end

	def hornear
		@tiempo_en_horno = rand(0..40)
	end
	def reportear
		hornear
		@array_de_tortas.each do |torta|			
			case
			#when @tiempo_en_horno < torta.tiempo_coccion then p  "cruda"
		 	when @tiempo_en_horno < torta.tiempo_coccion  then p "Torta de #{torta.tipo} casi lista"
			when @tiempo_en_horno == torta.tiempo_coccion then p "Torta de #{torta.tipo} lista"
			when @tiempo_en_horno > torta.tiempo_coccion then p "Torta de #{torta.tipo} quemada"
			end

		end
	end

end

t_uno = Tortas.new("jamon", 5)
t_dos = Tortas.new("biztec", 20)
t_tres = Tortas.new("cubana", 40)

lote = [t_uno,t_dos,t_tres]# estamos en el Scope Main

horno_de_gas = Horno.new(lote)
horno_de_gas.reportear
