# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parsero::PageViews do
  subject(:page_views) { described_class.new }

  describe 'acts as Enumerable' do
    let(:pages) { 10.times.map { |index| "/page#{index}" } }

    before do
      pages.each { |path| page_views.consume(path, '127.0.0.1') }
    end

    it { expect(page_views.to_a).to all(be_kind_of(Parsero::Page)) }
    it { expect(page_views.to_a.map(&:path)).to eq(pages) }
    it { expect(page_views.count).to eq(10) }
  end

  describe '#[]' do
    before { page_views.consume('/example', '127.0.0.1') }

    it { expect(page_views['/example']).to be_kind_of(Parsero::Page) }
    it { expect(page_views['/404']).to be_nil }
  end

  describe '#consume' do
    let(:path) { '/about' }
    let(:ip) { '127.0.0.1' }
    let(:second_ip) { '127.0.0.2' }

    it { expect { page_views.consume(path, ip) }.to change(page_views, :count).by(1) }

    it 'the same ip should not change number of Pages' do
      expect do
        20.times { page_views.consume(path, ip) }
      end.to change(page_views, :count).by(1)
    end

    it 'returns Page after consume' do
      expect(page_views.consume('/test', '127.0.0.1')).to be_kind_of(Parsero::Page)
    end
  end
end
