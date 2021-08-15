# frozen_string_literal: true

module Parsero
  # Tracks and contains list of visited Pages.
  class PageViews
    include Enumerable

    def initialize
      @pages = {}
    end

    def [](path)
      pages[path]
    end

    def consume(path, ip)
      (@pages[path] ||= Page.new(path)) << ip
    end

    def each(&block)
      pages.values.each(&block)
    end

    private

    attr_reader :pages
  end
end
