# frozen_string_literal: true

require_relative "heroicons/version"
require_relative "heroicons/icon"
require "json"

# Make the awesome heroicons library easy to use.
module Heroicons
  file_data = File.read(File.join(File.dirname(__FILE__), "./heroicons/data.json"))
  ICON_SYMBOLS = JSON.parse(file_data).freeze
end
