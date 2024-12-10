require 'date'

class Calendar
  attr_reader :year, :month

  def initialize(year, month)
    raise ArgumentError, "Invalid year" unless year.is_a?(Integer)
    raise ArgumentError, "Invalid month" unless year.is_a?(Integer)\
      && (1..12).include?(month)

    @year = year
    @month = month
  end

  def create_calendar
    [
      create_header,
      'Su Mo Tu We Th Fr Sa',
      create_days,
    ].join("\n")
  end

  def output_calendar
    puts create_calendar
  end

  private

  def create_header
    Date.new(year, month).strftime("    %B %Y")
  end

  def create_days
    days = []
    add_space(days)
    add_days(days)
    arrange_format(days)
  end

  def add_space(days)
    first_date = Date.new(year,month,1)
    space = first_date.wday
    space.times { days << ' ' }
  end

  def add_days(days)
    last_date = Date.new(year,month,-1)
    last_day = last_date.day
    (1..last_day).each {|day| days << day }
  end

  def arrange_format(days)
    days.each_slice(7).map do |week|
      week.map {|day| day.to_s.rjust(2)}
          .join(' ')
    end.join("\n")
  end
end

calendar = Calendar.new(2013, 4)
calendar.output_calendar
