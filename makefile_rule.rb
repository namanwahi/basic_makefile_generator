require_relative "file_utils"
class ObjectMakefileRule
  attr_reader :rule_name, :dependencies, :file_to_compile
  def initialize(filename)
    @file_to_compile = filename
    @rule_name = File.basename(filename, File.extname(filename)) + ".o"
    puts @rule_name
    @dependencies = get_dependancies(filename)
    puts @dependencies
    puts ""
  end
end

class ExeMakefile
  attr_reader :dependencies
  def initialize(object_file_rules, exe_name)
    @dependencies = object_file_rules.map{|o| o.rule_name}
    @rule_name = exe_name
    puts @rule_name
    puts @dependencies
  end
end

    
