# frozen_string_literal: true

module Parsero
  # This class transforms PageViews into stdout output with number of unique visits per page path
  class PrintMostUniqueVisited < Service
    def initialize(page_views)
      @page_views = page_views
    end

    def call
      page_views.sort_by(&:unique_visits).reverse.each do |page_view|
        puts "#{page_view.path} unique #{page_view.unique_visits} views"
      end
    end

    private

    attr_reader :page_views
  end
end
