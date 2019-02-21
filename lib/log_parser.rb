# The LogParser class parses the provided
# file and outputs an Array of page visits:
# [
#   { name: '/page/1', ip: '127.0.0.1' },
#   { name: '/index', ip: '198.126.0.2' }
# ]

class LogParser
  def initialize(file:)
    @file = file 
    @paths_and_ips ||= []
  end
  
  def parse_log
    parse_lines
    @paths_and_ips
  end

  private

  def parse_lines
   File.foreach(@file) do |line|
      path_and_ip = line.split(' ')
    
      @paths_and_ips << { path: path_and_ip[0], ip: path_and_ip[1] }
    end
  end
end

