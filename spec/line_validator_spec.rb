require_relative '../lib/line_validator'                                 
                                                         
RSpec.describe LineValidator do                             
  subject { described_class.validate(line) }                                                             
  
  let(:line) { [path, address] }                                                                         
  let(:path) { '/index' }                                                                                    
  let(:address) { '1.1.1.1' }                                                                                
                                                                                                       
  context 'when the line is a simple path' do                        
    it 'validates and returns 0' do                       
      expect(subject).to eq(0)                            
    end                                                                                             
  end                                                                                               
                                                                                                                                      
  context 'when the line is a path with id' do                                                                                      
    let(:path) { '/home_page/1' }                                                         
                                                                                           
    it 'validates and returns 0' do            
      expect(subject).to eq(0)                                                 
    end
   end
   
  context 'when the line is an invalid path' do
    let(:path) { 'an_invalid+path' }
  
    it 'validates and returns nil' do
      expect(subject).to eq(nil)
    end
  end
  
  context 'when the address is invalid' do
    let(:address) { '000.1023.0.x' }
  
    it 'validates and returns nil' do
      expect(subject).to eq(nil)
    end
  end

end

