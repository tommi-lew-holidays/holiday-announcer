require 'spec_helper'

describe MessageGenerator do
  subject { MessageGenerator }
  
  it 'generates the notification message' do
    message = subject.new('in', 'Friday Yay').call
    expected_message = "It's Friday Yay in in tomorrow, reminder that the team based there will be out of office."
    expect(message).to eq(expected_message)
  end

  describe 'multiple countries with the same holiday' do
    it 'generates the notification message with multiple countries mentioned' do
      message = subject.new('in, sg, kr', 'Friday Yay').call
      expected_message = "It's Friday Yay in in, sg, kr tomorrow, reminder that the team based there will be out of office."
      expect(message).to eq(expected_message)
    end
  end
end
