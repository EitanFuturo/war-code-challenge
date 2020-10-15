CHINA = {
    piqueros: 2,
    arqueros: 25,
    caballeros: 2
}

INGLESA = {
    piqueros: 10,
    arqueros: 10,
    caballeros: 10
}

BIZANTINA = {
    piqueros: 5,
    arqueros: 8,
    caballeros: 15
}

load 'piquero.rb'
load 'arquero.rb'
load 'caballero.rb'

class FabricaCivilizacion
  def self.build(civilizacion:)
    Civilizacion.new(
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

class Civilizacion
  attr_accessor :piqueros, :arqueros, :caballeros

  def initialize(piqueros:, arqueros:, caballeros:)
    @piqueros = piqueros
    @arqueros = arqueros
    @caballeros = caballeros
  end
end

class Ejercito
  attr_reader :civilizacion

  def initialize(civilizacion:)
    @civilizacion = civilizacion
    @piqueros = civilizacion[:piqueros]
  end

end

civilizacion = FabricaCivilizacion.build(civilizacion: CHINA)
civilizacion.piqueros.first.class
civilizacion.arqueros.first.class
civilizacion.caballeros.first.class