require 'spec_helper'

shared_context 'dummy_html' do
  before do
    allow(Net::HTTP).to receive(:start) do
      body = File.read 'spec/dummy_html/date-140823.html'
      double('response', body: body)
    end
  end
end

module Numa08Stalker
  describe Twilog do
    let(:twilog) { Twilog.new }
    let(:response) { twilog.fetch }

    describe '#fetch' do
      include_context 'dummy_html'

      it { expect(response.body).to match /@numa/ }
    end

    describe '#texts' do
      include_context 'dummy_html'

      let(:texts) { twilog.texts response.body }
      it { expect(texts).to include '気づいてしまったな……' }
    end
  end
end
