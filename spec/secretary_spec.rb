require 'spec_helper'

describe Secretary do
  describe 'next day is a holiday' do
    it 'triggers an annoucement' do
      allow_any_instance_of(MessageGenerator).to receive(:call).and_return('fake message')

      annoucer_double = double(Announcer)
      expect(Announcer).to receive(:new).with(message: 'fake message').and_return(annoucer_double)
      expect(annoucer_double).to receive(:call)
      
      # Singapore's National Day is on the 9 August
      Timecop.freeze(Date.new(Date.today.year, 8, 8)) { Secretary.new.call }
    end
  end
end
