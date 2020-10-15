load 'unidad.rb'
load 'arquero.rb'

class Piquero < Unidad

  def entrenar
    self.puntos_fuerza += 3
  end

  def transformar
    Arquero.new(puntos_iniciales: puntos_fuerza)
  end

  def costo_entrenamiento_default
    10
  end

  def costo_conversion_default
    30
  end

  def puntos_fuerza_default
    5
  end
end

piquero = Piquero.new
piquero.entrenar
piquero.entrenar
piquero.transformar