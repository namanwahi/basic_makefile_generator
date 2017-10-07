#require_relative 'makefile_rule'
def get_dependancies(filename)
  dependencies = Array.new
  file = File.open(filename, "r")
  file.each_line do |line|
    stripped_line = line.strip
    if /\s*#include\s+\".*?\"\s*\z/ =~ line
      dependency = line.scan(/"(.*?)"/)
      dependencies.push(dependency)
    end
  end
  file.close()
  dependencies.push(filename)
  return dependencies
end

def generate_makefile(compiler, exe_name, flags, object_rules, exe_rule)
  compiler_label = "CXX"
  exe_name_label = "EXE"
  flag_label = "FLAGS"
  
  makefile = File.open("makefile", "w")
  makefile.puts("#Generated Basic Makefile")
  makefile.puts("")
  makefile.puts("#Variables ")
  makefile.puts("#{compiler_label} = " + compiler)
  if flags.length > 0
    makefile.puts("#{flag_label} = " + flags.join(" "))
  end
  makefile.puts("#{exe_name_label} =  " + exe_name)
  makefile.puts("")
  makefile.puts("#Rules")
  makefile.puts("all: ${#{exe_name_label}}" )
  makefile.puts("")
  makefile.puts("${#{exe_name_label}}: " + exe_rule.dependencies.join(" "))
  makefile.puts("\t${#{compiler_label}} ${#{flag_label}}" + " -o ${#{exe_name_label}} " + exe_rule.dependencies.join(" ") )
  makefile.puts()
  object_rules.each do |rule|
    makefile.puts("")
    write_object_rule(makefile, rule, compiler_label, flag_label)
  end
  makefile.puts("")
  makefile.puts("clean:")
  makefile.puts("\trm -rf *.o ${#{exe_name_label}}")
  makefile.puts("")
  makefile.puts("#Make sure all and clean aren't generated as files")
  makefile.puts(".PHONY: all clean" )
end

def write_object_rule(makefile, object_rule, compiler_label, flag_label)
  makefile.puts(object_rule.rule_name + ": " + object_rule.dependencies.join(" "))
  makefile.puts("\t${#{compiler_label}} ${#{flag_label}} -c " +  object_rule.file_to_compile + " -o " +  object_rule.rule_name)
end
