class Secretary
  def call
    tomorrows_holidays.each do |holiday|
      holiday_info = extract_holiday_information(holiday)
      message = MessageGenerator.new(holiday_info[:countries], holiday_info[:name]).call
      Announcer.new(message: message).call
    end
  end

  private

  def countries
    [
      :in,
      :kr,
      :sg,
      :ua
    ]
  end

  def tomorrows_holidays
    tomorrow = Date.today + 1
    Holidays.on(tomorrow, countries)
  end

  # Extract holiday information returned by Holidays gem
  def extract_holiday_information(holiday)
    {
      name: holiday[:name],
      countries: holiday[:regions].join(', ')
    }
  end
end
