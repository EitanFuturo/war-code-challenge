load 'unidad.rb'
load 'caballero.rb'

class Arquero < Unidad

  def entrenar
    self.puntos_fuerza += 3
  end

  def transformar
    #Caballero.new(puntos_fuerza: puntos_fuerza)
  end

  def costo_entrenamiento_default
    20
  end

  def costo_conversion_default
    40
  end

  def puntos_fuerza_default
    10
  end
end


arquero = Arquero.new
arquero.entrenar