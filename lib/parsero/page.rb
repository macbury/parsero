# frozen_string_literal: true

module Parsero
  # Tells you how many visits page with current path has
  class Page
    include Enumerable
    attr_reader :path

    def initialize(path)
      @path = path
      @visits = []
    end

    def each(&block)
      @visits.each(&block)
    end

    def <<(ip)
      @visits << ip
      self
    end

    def <=>(other)
      count <=> other.count
    end

    def unique_visits
      uniq.count
    end
  end
end
