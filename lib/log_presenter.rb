# frozen_string_literal: true

require_relative 'log_parser'

# This class allows to present
# LogParser output data
class LogPresenter
  def initialize(visits_data:)
    @data = visits_data
  end

  def total_visits
    grouped_by_name.each.with_index do |(name, ips), index|
      around_entry(index) { log_total(name, ips) }
    end
  end

  def unique_visits
    grouped_by_name.each.with_index do |(name, ips), index|
      around_entry(index) { log_unique(name, ips) }
    end
  end

  private

  def grouped_by_name
    @grouped_by_name ||= @data.group_by do |visit|
      visit[:path]
    end
  end

  def log_total(name, ips)
    puts "#{name} #{ips.count} visits"
  end

  def log_unique(name, ips)
    puts "#{name} #{ips.uniq.count} unique visits"
  end

  def last_element?(index)
    (grouped_by_name.count - 1) == index
  end

  def around_entry(index)
    print_separator if index.zero?
    yield
    print_separator if last_element?(index)
  end

  def print_separator
    puts '------------------------'
  end
end
