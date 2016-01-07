#!/usr/bin/env ruby

require_relative 'lib/simulator'

if ARGV.length > 0
  puts 'No argument is required. Command to run: ruby robot_simulator.rb'
  exit 1
end

simulator = Simulator.new

while command_line = STDIN.gets
  output = simulator.execute(command_line)
  puts output if command_line.chomp == 'REPORT'
end
