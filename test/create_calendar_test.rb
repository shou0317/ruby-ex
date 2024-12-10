require 'minitest/autorun'
require_relative '../lib/create_calendar'

class CreateCalendarTest < Minitest::Test
  def test_create_calendar
    expected = <<~TEXT
        April 2013
    Su Mo Tu We Th Fr Sa
        1  2  3  4  5  6
    7  8  9 10 11 12 13
    14 15 16 17 18 19 20
    21 22 23 24 25 26 27
    28 29 30
    TEXT

    assert_equal expected, create_calendar(2013, 4)
  end
end
