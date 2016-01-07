require 'spec_helper'
require_relative '../lib/square_table'

describe 'SquareTable' do
  let(:table) { SquareTable.new(5, 5) }

  let(:valid_position) { Position.new(1, 1) }

  let(:invalid_position) { Position.new(-1, 1) }

  describe '#new' do
    it 'create an instance of SquareTable' do
      expect(table).to be_a SquareTable
    end
  end

  describe '#rows' do
    it { expect(table.rows).to eq 5 }
  end

  describe '#columns' do
    it { expect(table.columns).to eq 5 }
  end

  describe '#valid_position' do
    context 'when input position is outside the table range' do
      it { expect(table.valid_position(invalid_position)).to eq false }
    end

    context 'when input position is within the table range' do
      it { expect(table.valid_position(valid_position)).to eq true }
    end
  end

  describe '#place' do
    context 'when a robot is placed on on the table' do
      it 'has a valid position' do
        table.place(valid_position)
        expect(table.position).to eq valid_position
      end

      it 'has not being placed' do
        table.place(invalid_position)
        expect(table.position).to eq nil
      end
    end
  end

  describe '#placed?' do
    context 'when position is not being set' do
      before { table.place(invalid_position) }
      it 'returns false' do
        expect(table.placed?).to be false
      end
    end

    context 'when robot is being placed on table' do
      before { table.place(valid_position) }
      it 'returns true' do
        expect(table.placed?).to be true
      end
    end
  end
end
