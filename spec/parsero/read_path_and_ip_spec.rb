# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parsero::ReadPathAndIp do
  subject { described_class.call(line) }

  describe '#call' do
    describe 'when line is invalid' do
      let(:line) { 'yabadabaduu' }

      it { expect { subject }.to raise_error(ServiceFailure, 'Something is fishy with line: yabadabaduu') }
    end

    describe 'when line is with path and ip' do
      let(:line) { '/page1 127.0.0.1' }

      it { is_expected.to eq(['/page1', '127.0.0.1']) }
    end
  end
end
