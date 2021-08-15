# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parsero::PrintMostUniqueVisited do
  subject { described_class.call(page_views) }

  describe '#call' do
    let(:page_views) do
      page_views = Parsero::PageViews.new
      10.times { page_views.consume('/path1', '127.0.0.1') }
      page_views.consume('/path2', '127.0.0.2')
      page_views
    end

    it { expect { subject }.to output("/path2 unique 1 views\n/path1 unique 1 views\n").to_stdout }
  end
end
