# frozen_string_literal: true

module Parsero
  # Aggreagator transform lines into PageViews collection with Pages containing path and ip visits
  class Aggregator < Service
    use ReadPathAndIp, as: :read_path_and_ip

    def initialize(io)
      @io = io
      @page_views = PageViews.new
    end

    def call
      io.each_line do |line|
        path, ip = read_path_and_ip(line)
        page_views.consume(path, ip)
      end

      page_views
    end

    private

    attr_reader :io, :page_views
  end
end
