# This class allows to present 
# LogParser output data

class LogPresenter
  def initialize(visits_data:)
    @data = visits_data
  end

  def total_visits
    grouped_by_name.each do |name, ips|
      log_total(name, ips)
    end
  end

  def unique_visits
    grouped_by_name.each do |name, ips|
      log_unique(name, ips)
    end
  end

  private

  def grouped_by_name
    @data.group_by do |visit|
      visit[:path]
    end
  end

  def log_total(name, ips)
    puts "#{name} #{ips.count} visits"
  end

  def log_unique(name, ips)
    puts "#{name} #{ips.uniq.count} unique visits"
  end

end
