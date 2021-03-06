# frozen_string_literal: true

require "test_helper"

class HeroiconsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Heroicons::VERSION
  end

  def test_it_loads_all_heroicons_on_initializations
    refute_equal 0, Heroicons::ICON_SYMBOLS.length

    x_icon = Heroicons::ICON_SYMBOLS["x"]
    assert x_icon
  end

  def test_it_loads_one_icon_with_two_variants
    x_icon = Heroicons::ICON_SYMBOLS["x"]

    assert_equal 2, x_icon["variants"].length
    assert x_icon["variants"]["outline"]
    assert x_icon["variants"]["solid"]
  end

  def test_it_has_attributes_for_one_variants
    x_icon = Heroicons::ICON_SYMBOLS["x"]
    assert x_icon["variants"]["outline"]["height"]
    assert x_icon["variants"]["outline"]["width"]
    assert x_icon["variants"]["outline"]["path"]
  end
end
