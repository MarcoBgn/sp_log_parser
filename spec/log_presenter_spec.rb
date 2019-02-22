# frozen_string_literal: true

require_relative '../lib/log_presenter'
require_relative '../lib/log_parser'

RSpec.describe LogPresenter do
  let(:from_parser) { LogParser.new(file: 'webserver.log').parse_log }

  describe '#total_visits' do
    subject { described_class.new(visits_data: from_parser).total_visits }

    it 'prints out a list of names and total visits' do
      expect(STDOUT).to receive(:puts).with(
        '------------------------'
      )
      expect(STDOUT).to receive(:puts).with(
        '/about/2 90 visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/contact 89 visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/index 82 visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/about 81 visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/help_page/1 80 visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/home 78 visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '------------------------'
      )

      subject
    end
  end

  describe '#unique_visits' do
    subject { described_class.new(visits_data: from_parser).unique_visits }

    it 'prints out a list of paths and unique visits' do
      expect(STDOUT).to receive(:puts).with(
        '------------------------'
      )
      expect(STDOUT).to receive(:puts).with(
        '/help_page/1 23 unique visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/contact 23 unique visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/home 23 unique visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/index 23 unique visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/about/2 22 unique visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '/about 21 unique visits'
      )
      expect(STDOUT).to receive(:puts).with(
        '------------------------'
      )
      subject
    end
  end
end
