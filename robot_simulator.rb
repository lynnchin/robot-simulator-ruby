#!/usr/bin/env ruby

require_relative 'lib/simulator'

if ARGV.length > 0
  puts 'No argument is required. Command to run: ruby robot_simulator.rb'
  exit 1
end

robot_one_commands = File.readlines('command.txt')
robot_two_commands = File.readlines('robot2.txt')

simulator = Simulator.new

def execute_robot_commands(command, index,simulator)
  output = simulator.execute(command,index)
  puts output if command.chomp == 'REPORT'
end

robot_one_commands.each_with_index do | command1, index |
  command2 = robot_two_commands[index]
  execute_robot_commands(command1,0,simulator)
  execute_robot_commands(command2,1,simulator)
end


