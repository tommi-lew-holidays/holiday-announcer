# Extract and parse data from Holidays gem
# This is the only class that will interact with the Holidays gem directly

class HolidaysExtractor
  def call
    tomorrows_holidays.map do |holiday|
      {
        name: holiday[:name],
        countries: holiday[:regions].join(', ')
      }
    end
  end

  private
  
  # Tomorrow's holiday(s)
  def tomorrows_holidays
    tomorrow = Date.today + 1
    Holidays.on(tomorrow, countries)
  end

  def countries
    [
      :in,
      :kr,
      :sg,
      :ua
    ]
  end
end
