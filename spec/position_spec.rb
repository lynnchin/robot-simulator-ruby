require 'rspec'
require_relative '../lib/position'

describe 'Position' do
  subject { Position.new }

  describe '#new' do
    it 'creates an instance of Position' do
      expect(subject).to be_a Position
    end
  end

  describe '#to_s' do
    it 'displays the coordinate of position' do
      expect(subject.to_s).to eq '0,0'
    end
  end

  describe '#update' do
    it 'moves x-coordinate forward 1 unit' do
      subject.update(1, 0)
      expect(subject.x_coordinate).to eq 1
      expect(subject.y_coordinate).to eq 0
    end

    it 'moves x-coordinate backward by 1 unit' do
      subject.update(-1, 0)
      expect(subject.x_coordinate).to eq -1
      expect(subject.y_coordinate).to eq 0
    end

    it 'moves y-coordinate forward 1 unit' do
      subject.update(0, 1)
      expect(subject.x_coordinate).to eq 0
      expect(subject.y_coordinate).to eq 1
    end

    it 'moves x-coordinate backward by 1 unit' do
      subject.update(0, -1)
      expect(subject.x_coordinate).to eq 0
      expect(subject.y_coordinate).to eq -1
    end
  end
end
