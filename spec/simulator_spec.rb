require 'rspec'
require_relative '../lib/robot'
require_relative '../lib/square_table'
require_relative '../lib/simulator'

describe 'Simulator' do
  let(:simulator) { Simulator.new }

  let(:table) { double 'table' }

  let(:robot) { double 'robot' }

  let(:position) { double 'position' }

  describe '#new' do
    it 'creates an instance of Simulator' do
      expect(simulator).to be_a Simulator
    end

    it 'has a table' do
      expect(simulator.table).to be_a SquareTable
    end

    it 'has a robot' do
      expect(simulator.current_robot).to be_a Robot
    end
  end

  describe '#execute' do
    context 'with an empty string' do
      it 'returns nothing' do
        expect(simulator.execute('')).to eq nil
      end
    end

    context 'with whitespaces' do
      it 'returns nothing' do
        expect(simulator.execute('   ')).to eq nil
      end
    end

    context 'with move command' do
      describe 'before place command' do
        it 'raise an exception error' do
          expect { simulator.execute('MOVE') }.to raise_error RuntimeError
        end
      end
    end

    context 'with left command' do
      describe 'before place command' do
        it 'does nothing' do
          expect(simulator.execute('LEFT')).to eq nil
        end
      end
    end

    context 'with right command' do
      describe 'before place command' do
        it 'does nothing' do
          expect(simulator.execute('RIGHT')).to eq nil
        end
      end
    end

    context 'with report command' do
      describe 'before place command' do
        it 'does nothing' do
          expect(simulator.execute('REPORT')).to eq nil
        end
      end
    end

    context 'if nothing is on table' do
      it 'places robot on table' do
        expect(simulator.execute('PLACE 0,0,NORTH')).to eq nil
      end
    end
  end

  describe '#place' do
    context 'with an invalid coordinate' do
      it 'raise an exception error' do
        expect { simulator.place('6,6,NORTH') }.to raise_error RuntimeError
      end
    end

    context 'with an invalid direction' do
      it 'raise an exception error' do
        expect { simulator.place('0,0,UP') }.to raise_error RuntimeError
      end
    end

    context 'with valid coordinates and direction' do
      it 'places robot on table' do
        expect(simulator.place('0,0,NORTH')).to eq nil
      end
    end
  end

  describe '#move' do
    context 'when robot is placed on table' do
      before do
        simulator.execute('PLACE 0,0,NORTH')
      end
      it 'allows you to move north' do
        simulator.execute('MOVE')
        expect(simulator.table.position.x_coordinate).to eq 0
        expect(simulator.table.position.y_coordinate).to eq 1
      end
    end
  end

  describe '#left' do
    context 'when robot is placed on table' do
      before :each do
        simulator.execute('PLACE 0,0,NORTH')
      end
      it 'change the direction to west' do
        simulator.execute('LEFT')
        expect(simulator.current_robot.orientation).to eq :west
      end

      it 'change the direction to south' do
        simulator.current_robot.update_direction :west
        simulator.execute('LEFT')
        expect(simulator.current_robot.orientation).to eq :south
      end

      it 'change the direction to east' do
        simulator.current_robot.update_direction :south
        simulator.execute('LEFT')
        expect(simulator.current_robot.orientation).to eq :east
      end

      it 'change the direction to south' do
        simulator.current_robot.update_direction :east
        simulator.execute('LEFT')
        expect(simulator.current_robot.orientation).to eq :north
      end
    end
  end

  describe '#right' do
    context 'when robot is placed on table' do
      before :each do
        simulator.execute('PLACE 0,0,NORTH')
      end
      it 'change the direction to east' do
        simulator.execute('RIGHT')
        expect(simulator.current_robot.orientation).to eq :east
      end

      it 'change the direction to south' do
        simulator.current_robot.update_direction :east
        simulator.execute('RIGHT')
        expect(simulator.current_robot.orientation).to eq :south
      end

      it 'change the direction to east' do
        simulator.current_robot.update_direction :south
        simulator.execute('RIGHT')
        expect(simulator.current_robot.orientation).to eq :west
      end

      it 'change the direction to south' do
        simulator.current_robot.update_direction :west
        simulator.execute('RIGHT')
        expect(simulator.current_robot.orientation).to eq :north
      end
    end
  end

  describe '#report' do
    context 'when robot is placed on table' do
      before :each do
        simulator.execute('PLACE 0,0,NORTH')
      end
      it 'display the current position' do
        expect(simulator.execute('REPORT')).to eq '0,0,NORTH'
      end
    end

    context 'when robot is not on table' do
      it 'displays nothing' do
        expect(simulator.execute('REPORT')).to be_nil
      end
    end
  end
end
