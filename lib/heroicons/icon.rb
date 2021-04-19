# frozen_string_literal: true

module Heroicons
  class Icon
    attr_reader :path, :options, :width, :height, :symbol, :variant

    def initialize(symbol, variant, options = {})
      @symbol = symbol.to_s
      @variant = variant.to_s

      icon = get_icon(@symbol, @variant)

      @path = icon["path"]
      @width = icon["width"]
      @height = icon["height"]
      @options = options.dup
      @options.merge!(default_options)
    end

    # Returns an string representing a <svg> tag
    def to_svg
      "<svg xmlns=\"http://www.w3.org/2000/svg\" #{html_attributes}>#{@path}</svg>"
    end

    private

    def html_attributes
      attrs = ""
      @options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    def default_options
      case @variant
      when "outline"
        {
          viewBox: viewbox,
          fill: "none",
          stroke: "currentColor"
        }
      when "solid"
        {
          viewBox: viewbox,
          fill: "currentColor"
        }
      end
    end

    def viewbox
      "0 0 #{@width} #{@height}"
    end

    def get_icon(symbol, variant)
      icon = Heroicons::ICON_SYMBOLS[symbol]
      raise "Couldn't find heroicons symbol for #{@symbol.inspect}" unless icon

      icon_in_variant = icon["variants"][variant]
      raise "Heroicons symbol for #{@symbol.inspect} don't have variant #{@variant.inspect}" unless icon_in_variant

      {
        "name" => icon["name"],
        "variant" => variant,
        "width" => icon_in_variant["width"],
        "height" => icon_in_variant["height"],
        "path" => icon_in_variant["path"]
      }
    end
  end
end
