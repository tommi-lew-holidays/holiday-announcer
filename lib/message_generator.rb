class MessageGenerator
  attr_reader :countries, :holiday_name

  def initialize(countries, holiday_name)
    @countries = countries
    @holiday_name = holiday_name
  end

  def call
    "It's #{holiday_name} in #{countries} tomorrow, reminder that the team based there will be out of office."
  end
end