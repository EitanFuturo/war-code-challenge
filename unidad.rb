class Unidad
  attr_accessor :puntos_fuerza, :costo_entrenamiento, :costo_conversion

  def initialize(puntos_iniciales: nil)
    @puntos_fuerza = calcular_fuerza(puntos_iniciales)
    @costo_entrenamiento = costo_entrenamiento_default
    @costo_conversion = costo_conversion_default
  end

  def transformar
    raise "Subclass responsability"
  end

  def costo_entrenamiento_default
    raise "Subclass responsability"
  end

  def costo_conversion_default
    raise "Subclass responsability"
  end

  def puntos_fuerza_default
    raise "Subclass responsability"
  end

  private

  def calcular_fuerza(puntos_iniciales)
    return puntos_fuerza_default unless puntos_iniciales
    puntos_iniciales > puntos_fuerza_default ? puntos_iniciales : puntos_fuerza_default
  end
end