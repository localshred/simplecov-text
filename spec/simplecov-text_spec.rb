require 'spec_helper'

describe SimpleCov::Formatter::TextFormatter do
  
  subject { SimpleCov::Formatter::TextFormatter.new }
  
  def read_coverage_file(file)
    File.read(file)
  end
  
  describe '#format' do
    let(:result) {
      double('simplecov result', {
        :covered_percent => 75.0,
        :covered_lines => 75,
        :total_lines => 100,
        :covered_strength => 1.0,
        :groups => [group]
      })
    }
    
    let(:group) {
      double('group', {
        :name => 'My Test Group',
        :files => [file]
      })
    }
    
    let(:file) {
      double('file', {
        :filename => 'my_test_file.rb',
        :covered_percent => 75.0
      })
    }
  
    it 'responds to #format method' do
      subject.should respond_to(:format)
    end
    
    it 'writes the covered percentage to the text file' do
      result.stub_chain(:groups, :each).and_yield(group.name, group.files)
      subject.format(result)
      read_coverage_file(subject.path).should =~ /75.00/
    end
  end
  
  describe '#write_result' do
    it 'writes the given line to the coverage file' do
      subject.write_result('Hello, World')
      read_coverage_file(subject.path).should =~ /Hello, World/
    end
  end
  
  describe '#path' do
    it 'provides the coverage output file path' do
      subject.path.should eq(File.join(SimpleCov.coverage_path, 'result.txt'))
    end
  end
  
end
