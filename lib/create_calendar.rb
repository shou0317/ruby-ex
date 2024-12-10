require 'date'

class Calendar
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def create_calendar
    calendar = []
    calendar.push(create_header)
    calendar.push('Su Mo Tu We Th Fr Sa')
    calendar.push(create_days)
    calendar.join("\n")
  end

  def output_calendar
    puts create_calendar
  end

  private

  def create_header
    date = Date.new(year, month)
    converted_month = date.strftime('%B')
    header = "    #{converted_month} #{year}"
  end

  def create_days
    days = []
    days = add_space(days)
    days = add_days(days)
    formated_days = arrange_format(days)
  end

  def add_space(days)
    first_date = Date.new(year,month,1)
    space = first_date.wday
    days << ' ' * space
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
