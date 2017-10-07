def get_dependancies(filename)
  dependancies = Array.new
  file = File.open(filename, "r")
  file.each_line do |line|
    stripped_line = line.strip
    if /\s*#include\s+\".*?\"\s*\z/ =~ line
      dependancy = line.scan(/"(.*?)"/)
      dependancies.push(dependancy)
    end
  end
  file.close()
  return dependancies
end
