require 'rspec'
require 'byebug'
require 'algorithm.rb'

describe StringSearch do
  let(:vars) { { string:"ABC ABCDAB ABCDABCDABDE",
    search_string: "ABCDABD"} }
  let(:string_test) { StringSearch.new(vars) }

  describe 'Initialize' do
    it 'should initialize with a string and a search string' do
      expect(string_test.string).to be_a(String)
      expect(string_test.search_string).to be_a(String)
    end

    it 'should initialize an empty string table' do
      expect(string_test.offset_table).to be_a(Array)
    end
  end

  describe 'Fill Table' do
    it "fills the string table with substrings and their lengths" do
      string_test.fill_table
      expect(string_test.offset_table).to eq([-1,0,0,0,0,1,2])
    end
  end

  describe 'Search String' do
    before(:each) do
      string_test.fill_table
	  end

    it 'returns True for a substring within the string' do
      expect(string_test.find_substring).to eq(true)
    end

  end



end
