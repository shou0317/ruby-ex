require 'date'

def convert_month(m,y)
  date = Date.new(y,m)
  date.strftime('%B')
end

def return_year(m,y)
  y
end

def create_calendar(m,y)
  first_date = Date.new(y,m,1)
  last_date = Date.new(y,m,-1)

  last_day = last_date.day
  space_count = first_date.wday

  days = []
  days << ' ' * space_count
  (1..last_day).each {|day| days << day }

  days.each_slice(7).map do |week|
    week.map {|day| day.to_s.rjust(2)}
        .join(' ')
  end.join("\n")
end

month = convert_month(4, 2013)
year = return_year(4,2013)
puts "     #{month} #{year}"
puts 'Su Mo Tu We Th Fr Sa'
puts create_calendar(4, 2013)
