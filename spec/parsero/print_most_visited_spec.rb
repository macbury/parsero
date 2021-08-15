# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parsero::PrintMostVisited do
  subject { described_class.call(page_views) }

  describe '#call' do
    let(:page_views) do
      page_views = Parsero::PageViews.new
      page_views.consume('/path1', '127.0.0.1')
      2.times { |index| page_views.consume('/path2', "127.0.0.#{index}") }
      page_views
    end

    it { expect { subject }.to output("/path2 2 visits\n/path1 1 visits\n").to_stdout }
  end
end
