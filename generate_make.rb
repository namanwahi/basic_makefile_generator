require_relative 'makefile_rule'
if ARGV.length < 3
  puts "Please enter your format in the form: path_to_project compiler executable_name [compiler flags]"
  exit(1)
end

if !File.directory?(ARGV[0])
  puts "Please enter a valid target path"
  exit(1)
else
  puts "target directory is ARGV[0]"
  Dir.chdir(ARGV[0])
end

$compiler = ARGV[1]
$exec = ARGV[2]
$compiler_flags = Array.new
(3..ARGV.length-1).each do |index|
  $compiler_flags.push(ARGV[index])
end

$compiler_flags.each do |flag|
  print flag + " "
end
puts ""

cpp_file_extension = [".cc", ".cpp", ".cxx", ".C", ".c++"]
all_source_files = Dir["**/*"].select{|f| File.file?(f)}.select{|f| cpp_file_extension.include?(File.extname(f))}

puts all_source_files

object_rule_array = Array.new
all_source_files.each do |f|
  object_rule_array.push(MakefileRule.new(f))
end
