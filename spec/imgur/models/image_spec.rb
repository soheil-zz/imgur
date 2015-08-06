require_relative '../../spec_helper'
require 'imgurapi'

describe Imgurapi::Image do

  let(:image) { described_class.new id: 1 }

  describe '#link' do
    it { expect(image.link).to eq 'http://i.imgur.com/1.jpg' }
  end

  describe '#url' do
    it { expect(image.url).to eq 'http://i.imgur.com/1.jpg' }
    it { expect(image.url(:s)).to eq 'http://i.imgur.com/1s.jpg' }
    it { expect(image.url(:l)).to eq 'http://i.imgur.com/1l.jpg' }
  end
end
