class Printer
  def initialize(filename)
    @file_data = File.open(filename).readlines.map(&:chomp)
    @output_info = prepend
  end

  def print
    batch.each_with_index do |inner_array, index|
      output_filename = "./output/batch_#{ (index + 1) }"
      puts "Printing batch #{index + 1} at filepath: #{output_filename}"

      File.open(output_filename, 'w+') do |f|
        f.puts(inner_array)
      end

      puts "Finished batch #{index + 1} at filepath: #{output_filename}"
    end
  end

  def batch
    if prepend.count < 50
      main_batch = []
      main_batch << @output_info
    else
      main_batch = []
      count = (prepend.count / 50)
      (count + 1).times { main_batch << [] }

      (count + 1).times do |index|
        build_inner_array(index, main_batch)
      end
      main_batch
    end
  end

  def build_inner_array(inner_array_index, main_arry)
    50.times do
      main_arry[inner_array_index] << @output_info[0]
      @output_info.shift
    end
  end

  def prepend
    @file_data.map do |account_num|
      "Account:#{account_num}"
    end
  end
end