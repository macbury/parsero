# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parsero::Page do
  subject(:page) { described_class.new(path) }

  describe '#<<' do
    subject(:push_ip) { page << '128.0.0.2' }
    let(:path) { '/about' }

    it { expect(push_ip).to be_kind_of(Parsero::Page) }
    it { expect { 10.times { page << '128.0.0.2' } }.to change(page, :count).by(10) }
    it { expect { 10.times { page << '128.0.0.2' } }.to change(page, :unique_visits).by(1) }
  end

  describe '<=>' do
    let(:page_a) do
      Parsero::Page.new('/path1').tap { |page| ['127.0.0.2', '127.0.0.1', '127.0.0.3'].each { |ip| page << ip } }
    end

    let(:page_b) do
      Parsero::Page.new('/path1').tap { |page| page << '127.0.0.1' }
    end

    it { expect([page_a, page_b].sort).to eq([page_b, page_a]) }
  end

  describe 'acts as Enumerable' do
    subject(:enumerable) do
      Parsero::Page.new('/path1').tap do |page|
        ['127.0.0.2', '127.0.0.1', '127.0.0.3'].each do |ip|
          page << ip
        end
      end
    end

    it { expect(enumerable.to_a).to eq(['127.0.0.2', '127.0.0.1', '127.0.0.3']) }
    it { expect(enumerable).to respond_to(:each) }
  end
end
