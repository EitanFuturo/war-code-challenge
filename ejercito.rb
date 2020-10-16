CHINA = {
    nombre: 'Chino',
    piqueros: 2,
    arqueros: 25,
    caballeros: 2
}

INGLESA = {
    nombre: 'Inglés',
    piqueros: 10,
    arqueros: 10,
    caballeros: 10
}

BIZANTINA = {
    nombre: 'Bizantino',
    piqueros: 5,
    arqueros: 8,
    caballeros: 15
}

load 'piquero.rb'
load 'arquero.rb'
load 'caballero.rb'

class FabricaEjercito
  def self.build(civilizacion:)
    Ejercito.new(
       civilizacion: civilizacion[:nombre],
       piqueros: build_piqueros(civilizacion[:piqueros]),
       arqueros: build_arqueros(civilizacion[:arqueros]),
       caballeros: build_caballeros(civilizacion[:caballeros])
    )
  end

  def self.build_piqueros(cantidad)
    piqueros = []
    cantidad.times do
      piqueros << Piquero.new
    end
    piqueros
  end

  def self.build_arqueros(cantidad)
    arqueros = []
    cantidad.times do
      arqueros << Arquero.new
    end
    arqueros
  end

  def self.build_caballeros(cantidad)
    caballeros = []
    cantidad.times do
      caballeros << Caballero.new
    end
    caballeros
  end
end

class Ejercito
  attr_accessor :civilizacion, :piqueros, :arqueros, :caballeros, :oro

  def initialize(civilizacion:, piqueros:, arqueros:, caballeros:)
    @civilizacion = civilizacion
    @piqueros = piqueros
    @arqueros = arqueros
    @caballeros = caballeros
    @oro = 1000
  end

  def entrenar(unidad)
    unidad.entrenar
    self.oro -= unidad.costo_entrenamiento
  end
end

#class Ejercito
#  attr_reader :civilizacion, :piqueros, :arqueros, :caballeros
#
#  def initialize(civilizacion:)
#    @civilizacion = civilizacion
#    @piqueros = civilizacion.piqueros
#    @arqueros = civilizacion.arqueros
#    @caballeros = civilizacion.caballeros
#    @oro = 1000
#  end
#

#end

ejercito_chino = FabricaEjercito.build(civilizacion: CHINA)

ejercito_ingles = FabricaEjercito.build(civilizacion: INGLESA)

ejercito_bizantino = FabricaEjercito.build(civilizacion: BIZANTINA)


ejercito_chino.civilizacion
ejercito_ingles.civilizacion
ejercito_bizantino.civilizacion

ejercito_chino.oro
ejercito_chino.piqueros.first.puntos_fuerza
ejercito_chino.entrenar(ejercito_chino.piqueros.first)
ejercito_chino.oro
ejercito_chino.piqueros.first.puntos_fuerza