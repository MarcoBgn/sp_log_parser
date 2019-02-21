# frozen_string_literal: true

require 'singleton'

# This class validates each line
# of the provided file to check
# it has the format: 'path ip-address'
class LineValidator
  include Singleton

  # Regexp to validate real IPv4 addresses
  UP_TO_255 ||= /\d{,2}|1\d{2}|2[0-4]\d|25[0-5]/.freeze
  # Workaround regexp to support up to 999
  UP_TO_999 ||= /\d{1,3}/.freeze

  def self.validate(line)
    # Matches paths i.e. /index /home_page/1
    line.first =~ %r{\A/\w+(/)?(\d+)?} &&
      # Matches addresses up to 999.999.999.999
      line.last =~ /\A#{UP_TO_999}\.#{UP_TO_999}\.#{UP_TO_999}\.#{UP_TO_999}\z/
  end
end
