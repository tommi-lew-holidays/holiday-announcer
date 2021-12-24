class Secretary
  def call
    holidays = HolidaysExtractor.new.call
    
    holidays.each do |holiday|  
      message = MessageGenerator.new(holiday[:countries], holiday[:name]).call
      Announcer.new(message: message).call
    end
  end

  private

  def tomorrows_holidays
    HolidayExtractor.new.call
  end
end
