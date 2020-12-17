require 'pry'
require './printer.rb'

input_file = ARGV[0]

Printer.new(input_file).print