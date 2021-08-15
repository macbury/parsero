# frozen_string_literal: true

module Parsero
  # Try to transform line of text into path and ip
  # Input should be in format:
  #   /path 192.168.1.22
  # Example weblogs contains invalid ip, so there is no ip validation here.
  class ReadPathAndIp < Service
    def initialize(line)
      @line = line
    end

    def call
      parts = line.split(' ').map(&:strip)
      raise ServiceFailure, "Something is fishy with line: #{line}" if parts.size != 2

      parts
    end

    private

    attr_reader :line
  end
end
