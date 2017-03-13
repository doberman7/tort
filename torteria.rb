=begin
¿Qué clases crees que sean necesarias? TORTAS HORNO
¿Qué atributos deben tener las clases?
  TORTAS: TEMPERATURA SABOR ESTADO
  HORNO: TEMEPERATURA ESPACIO
¿Cuál es el comportamiento necesario para cada una?
  TORTAS: cruda, casi lista, lista y quemada.
  HORNO: aumento disminución de TEMPERATURA, LOTE del tipo X
¿Cómo van a interactuar las clases entre ellas?
  Dado una TEMPERATURA en horno las TORTAS camabiaran de estado de frias a ok a quemadas
  el  lote en horno estará lleno o con espacio dependiendo de la cantidad de tortas
¿Cómo divides el código para que cada clase y método tenga una única responsabilidad?
  en tortas, horno y lotes
¿cómo puedes hacer para meter varias tortas con tiempos diferentes de horneado?
  antes de meter al horno
    separar las tortas  dependiendo  del tiempo de cocción necesario para estar listas
    asignar tortas separadas en lotes
  ingresar al horno
Implementa una manera para saber en que etapa del horneado se encuentra cada tipo de torta.
Puedes usar los siguientes estados: crudo, casi listo, listo y quemado.
=end
class Tortas

end
class Horno
end
class Lote
end
