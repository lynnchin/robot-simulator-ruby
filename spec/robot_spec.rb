require 'rspec'
require_relative '../lib/robot'

describe 'Robot' do
  subject { Robot.new }

  describe '#new' do
    it 'creates an instance of Robot' do
      expect(subject).to be_a Robot
    end
  end

  describe '#set_orientation' do
    it 'returns no direction' do
      expect(subject.orientation).to eq nil
    end

    it 'is facing north' do
      subject.update_direction :north
      expect(subject.orientation).to eq :north
    end

    it 'is facing south' do
      subject.update_direction :south
      expect(subject.orientation).to eq :south
    end

    it 'is facing east' do
      subject.update_direction :east
      expect(subject.orientation).to eq :east
    end

    it 'is facing west' do
      subject.update_direction :west
      expect(subject.orientation).to eq :west
    end

    context 'when a unknown direction is specified' do
      it 'raises an error' do
        expect { subject.update_direction :up }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#left' do
    context 'when there is no direction' do
      it 'raise an error' do
        expect { subject.left }.to raise_error(RuntimeError)
      end
    end

    context 'when facing north' do
      before { subject.update_direction :north }
      it 'turns to face west' do
        subject.left
        expect(subject.orientation).to eq :west
      end
    end

    context 'when facing west' do
      before { subject.update_direction :west }
      it 'turns to face south' do
        subject.left
        expect(subject.orientation).to eq :south
      end
    end

    context 'when facing south' do
      before { subject.update_direction :south }
      it 'turns to face east' do
        subject.left
        expect(subject.orientation).to eq :east
      end
    end
  end

  describe '#right' do
    context 'when there is no direction' do
      it 'raise an error' do
        expect { subject.right }.to raise_error(RuntimeError)
      end
    end

    context 'when facing north' do
      before { subject.update_direction :north }
      it 'turns to face west' do
        subject.left
        expect(subject.orientation).to eq :west
      end
    end

    context 'when facing east' do
      before { subject.update_direction :east }
      it 'turns to face north' do
        subject.left
        expect(subject.orientation).to eq :north
      end
    end

    context 'when facing south' do
      before { subject.update_direction :south }
      it 'turns to face east' do
        subject.left
        expect(subject.orientation).to eq :east
      end
    end
  end

  describe '#to_s' do
    context 'when facing south' do
      before { subject.update_direction :south }
      it 'returns SOUTH' do
        expect(subject.to_s).to eq 'SOUTH'
      end
    end

    context 'when facing north' do
      before { subject.update_direction :north }
      it 'returns NORTH' do
        expect(subject.to_s).to eq 'NORTH'
      end
    end

    context 'when facing east' do
      before { subject.update_direction :east }
      it 'returns EAST' do
        expect(subject.to_s).to eq 'EAST'
      end
    end

    context 'when facing west' do
      before { subject.update_direction :west }
      it 'returns WEST' do
        expect(subject.to_s).to eq 'WEST'
      end
    end
  end
end
