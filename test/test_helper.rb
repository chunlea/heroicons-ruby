# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "heroicons"

require "minitest/autorun"

def heroicons(symbol, variant, options = {})
  ::Heroicons::Icon.new(symbol, variant, options)
end
