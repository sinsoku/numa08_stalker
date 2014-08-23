require 'spec_helper'

module Numa08Stalker
  describe Twilog do
    describe '#fetch' do
      it '', slow: true do
        twilog = Twilog.new
        response = twilog.fetch
        expect(response.body).to match /@numa/
      end
    end

    describe '#texts' do
      it '', slow: true do
        twilog = Twilog.new
        response = twilog.fetch
        texts = twilog.texts response.body
        expect(texts).to include '気づいてしまったな……'
      end
    end
  end
end
