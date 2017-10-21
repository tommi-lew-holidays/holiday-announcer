class Secretary
  def call
    if tomorrows_holiday
      message = message(locale, tomorrows_holiday[:name])
      Announcer.new(message: message).call
    end
  end

  private

  def locale
    :sg
  end

  def tomorrows_holiday
    tomorrow = Date.today + 1
    Holidays.on(tomorrow, :sg)&.first
  end

  def message(country, holiday_name)
    "It's #{holiday_name} in #{country} tomorrow. Happy #{holiday_name}!"
  end
end
