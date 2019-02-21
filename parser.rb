#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'log_presenter'

begin
  parsed_data = LogParser.new(file: ARGV[0]).parse_log

  LogPresenter.new(visits_data: parsed_data).total_visits
  LogPresenter.new(visits_data: parsed_data).unique_visits
rescue TypeError
  puts 'Usage: ruby ./parser.rb {a_log_file.log}'
end
