require 'minitest/autorun'
load './ejercito.rb'

class EjercitoTest < Minitest::Test
  def setup
    @ejercito_chino = FabricaEjercito.build(civilizacion: CHINA)
    @ejercito_ingles = FabricaEjercito.build(civilizacion: INGLESA)
  end

  def test_build_civilizacion_china
    assert_equal 'Chino', @ejercito_chino.civilizacion
  end

  def test_combate_de_ejercitos
    @ejercito_chino.atacar(@ejercito_ingles)
    assert_equal 1100, @ejercito_ingles.oro
  end

  def test_empate_entre_ejercitos
    @ejercito_chino.puntos_fuerza = 100
    @ejercito_ingles.puntos_fuerza = 100
    @ejercito_chino.atacar(@ejercito_ingles)
    assert_equal 28, @ejercito_chino.unidades.count
    assert_equal 29, @ejercito_ingles.unidades.count
  end
end