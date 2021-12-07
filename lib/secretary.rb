class Secretary
  def call
    if tomorrows_holiday
      message = message(country, tomorrows_holiday[:name])
      Announcer.new(message: message).call
    end
  end

  private

  def country
    :sg
  end

  def tomorrows_holiday
    tomorrow = Date.today + 1
    Holidays.on(tomorrow, country)&.first
  end

  def message(country, holiday_name)
    "It's #{holiday_name} in #{country} tomorrow, the team based in #{country} will be out of office."
  end
end
