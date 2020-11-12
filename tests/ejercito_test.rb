require 'minitest/autorun'
load './ejercito.rb'
#load '../piquero.rb'

class EjercitoTest < Minitest::Test
  def setup
    @ejercito_chino = FabricaEjercito.build(civilizacion: CHINA)
    @ejercito_ingles = FabricaEjercito.build(civilizacion: INGLESA)
  end

  def test_build_civilizacion_china
    assert_equal 'Chino', @ejercito_chino.civilizacion
  end

  def test_combate_de_ejercitos
    assert_equal 'Ganador: Inglés', @ejercito_chino.atacar(@ejercito_ingles)
  end
end