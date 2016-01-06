require 'rspec'
require_relative '../lib/position'

describe 'Position' do
  subject { Position.new }

  describe '#new' do
    it 'creates an instance of Position' do
      expect(subject).to be_a Position
    end
  end

  describe '#display' do
    it 'displays the coordinate of position' do
      expect(subject.display).to eq '0,0'
    end
  end

  describe '#validate_coordinates' do
    context 'when input (x,y) coordinates are out of table range' do
      it 'raises an error' do
        expect { subject.validate_coordinates(5, 6, 5) }.to raise_error(RuntimeError)
      end
    end

    context 'when input (x,y) coordinates within table range' do
      it 'does not raise an error' do
        expect(subject.validate_coordinates(5, 4, 5)).to eq nil
      end
    end
  end
end
