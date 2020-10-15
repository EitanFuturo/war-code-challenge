load 'unidad.rb'

class Caballero < Unidad
  def entrenar
    self.puntos_fuerza += 3
  end

  def transformar
    nil
  end

  def costo_entrenamiento_default
    30
  end

  def costo_conversion_default
    0
  end

  def puntos_fuerza_default
    20
  end
end

caballero = Caballero.new
caballero.entrenar