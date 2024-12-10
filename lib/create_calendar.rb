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
    first_date = Date.new(year,month,1)
    last_date = Date.new(year,month,-1)

    days = Array.new(first_date.wday, ' ') # 空白を追加
    days += (1..last_date.day).map {|day| day.to_s.rjust(2)} # 日付を追加

    days.each_slice(7).map { |week| week.join(' ') }.join("\n")
  end
end

calendar = Calendar.new(2013, 4)
calendar.output_calendar
