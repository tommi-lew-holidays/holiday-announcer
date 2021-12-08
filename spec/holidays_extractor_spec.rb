require 'spec_helper'

describe HolidaysExtractor do
  it 'returns holidays in an array of hash' do
    Timecop.freeze(Date.new(Date.today.year, 2, 1)) do
      holidays = HolidaysExtractor.new.call
      holiday = holidays.first
      
      expect(holiday[:name]).to eq('IN Holiday on 2nd Feb')
      expect(holiday[:countries]).to include('in') 
    end
  end

  describe 'same holiday on the same day' do
    it 'returns 1 holiday' do
      Timecop.freeze(Date.new(Date.today.year, 3, 1)) do
        holidays = HolidaysExtractor.new.call
        expect(holidays.size).to eq(1)
      end    
    end
  end
  
  describe 'different holidays on the same day' do
    it 'returns multiple holidays' do
      Timecop.freeze(Date.new(Date.today.year, 2, 1)) do
        holidays = HolidaysExtractor.new.call
        expect(holidays.size).to eq(2)
      end    
    end
  end
end
