require 'pry'
require './printer.rb'

input_file = ARGV[0]

puts Printer.new(input_file).print

# To Run please copy past in command line:
# ruby run.rb {:file_name}

# If you paste the ID's into the provided input text file you can use:
# ruby run.rb ./input/ids.txt