# The LogParser class parses the provided
# file and outputs an Array of page visits:
# [
#   { name: '/page/1', ip: '127.0.0.1' },
#   { name: '/index', ip: '198.126.0.2' }
# ]
require_relative 'line_validator'

class LogParser
  def initialize(file:, validator: LineValidator)
    @file = file 
    @line_validator = validator 
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
    
      next unless @line_validator.validate(path_and_ip)

      @paths_and_ips << { path: path_and_ip[0], ip: path_and_ip[1] }
    end
  end
end

