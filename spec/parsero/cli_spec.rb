# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parsero::Cli do
  subject(:cli) { described_class.call(io) }

  describe 'when file path is pointing to real log file' do
    let(:io) { File.new('./spec/fixtures/example.log') }
    let(:example_output) { File.read('./spec/fixtures/example_output') }

    it { expect { cli }.to output(example_output).to_stdout }
  end
end
