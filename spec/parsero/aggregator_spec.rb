# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parsero::Aggregator do
  subject(:aggregator_result) { described_class.call(io) }

  describe '#call' do
    let(:io) { File.new('./spec/fixtures/example.log') }

    it 'collect page views' do
      expect(aggregator_result.count).to eq(4)
    end
  end
end
