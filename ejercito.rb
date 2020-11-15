require 'byebug'
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
  attr_accessor :civilizacion, :unidades, :piqueros, :arqueros, :caballeros, :oro, :puntos_fuerza

  def initialize(civilizacion:, piqueros:, arqueros:, caballeros:)
    @civilizacion = civilizacion
    @piqueros = piqueros
    @arqueros = arqueros
    @caballeros = caballeros
    @unidades = piqueros + arqueros + caballeros
    @oro = 1000
  end

  def entrenar(unidad)
    unidad.entrenar
    self.oro -= unidad.costo_entrenamiento
  end

  def transformar(unidad_inicial)
    return 'Los caballeros no pueden ser entrenados.' if unidad_inicial.class == Caballero

    nueva_unidad = unidad_inicial.transformar
    unidades = [piqueros, arqueros, caballeros]

    unidades.each do | unidad |
      unidad.pop if unidad.first.class == unidad_inicial.class
      unidad << nueva_unidad if unidad.first.class == nueva_unidad.class
    end
    self.oro -= unidad_inicial.costo_conversion
  end

  def atacar(otro_ejercito)
    return empatar(otro_ejercito) if otro_ejercito.puntos_fuerza == puntos_fuerza

    otro_ejercito.puntos_fuerza > puntos_fuerza ? perder(otro_ejercito) : ganar
  end

  def puntos_fuerza
    @puntos_fuerza ||= unidades.reduce(0) { | sum, unidad | sum + unidad.puntos_fuerza }
  end

  def ganar
    self.oro += 100
  end

  def perder(otro_ejercito)
    otro_ejercito.ganar
  end

  def empatar(otro_ejercito=nil)
    unidades.pop
    otro_ejercito.unidades.pop if otro_ejercito
  end
end

