require_relative "cpp_file_reading_utils"
class MakefileRule
  attr_reader :rule_name, :dependancies, :command
  def initialize(filename)
    @rulename = File.basename(filename)
    @dependancies = get_dependancies(filename)
    puts dependancies
  end
end

    
