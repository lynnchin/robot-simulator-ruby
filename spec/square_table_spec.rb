require 'spec_helper'
require_relative '../lib/square_table'

describe 'SquareTable' do
  let(:table) { SquareTable.new(5, 5) }

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

  describe '#check_position' do
    context 'when input position is outside the table range' do
      it { expect(table.check_position(-1, 1)).to eq false }
    end

    context 'when input position is within the table range' do
      it { expect(table.check_position(1, 1)).to eq true }
    end
  end
end
