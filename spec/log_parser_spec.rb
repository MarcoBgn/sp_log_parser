require 'rspec'
require_relative '../lib/log_parser'

RSpec.describe LogParser do
  describe 'self.parse_log' do
    subject { described_class.new(file: file).parse_log }
    
    let(:file) { 'webserver.log' }
    let(:expected_first) do
      { path: '/help_page/1', ip: '126.318.035.038' }
    end
    let(:expected_lines) { File.read(file).lines.count }
    
    it 'returns an array of hashes' do
      expect(subject).to be_an(Array)
    end
    
    it 'parses an hash for each line' do
      expect(subject.count).to eq(expected_lines)
    end

    it 'parses each line as a Hash with name and ip' do
      expect(subject.first).to eq(expected_first)
    end
  end
end
