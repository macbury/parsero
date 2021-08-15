# frozen_string_literal: true

module Parsero
  # Starting point of the parser. It receives IO object
  class Cli < Service
    use Aggregator, as: :aggregate_views_from
    use PrintMostVisited, as: :print_most_visited
    use PrintMostUniqueVisited, as: :print_most_unique_visits

    def initialize(io)
      @io = io
    end

    def call
      page_views = aggregate_views_from(io)

      print_most_visited(page_views)
      print_divider
      print_most_unique_visits(page_views)
    end

    private

    attr_reader :io

    def print_divider
      puts '-' * 100
    end
  end
end
