# frozen_string_literal: true

module Parsero
  # This class transforms PageViews into stdout output with number of visits per page path
  class PrintMostVisited < Service
    def initialize(page_views)
      @page_views = page_views
    end

    def call
      page_views.sort.reverse.each do |page_view|
        puts "#{page_view.path} #{page_view.count} visits"
      end
    end

    private

    attr_reader :page_views
  end
end
