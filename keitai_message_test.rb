require 'minitest/autorun'

class TestKeitaiMessage < Minitest::Test
  def test_convert_number_to_string
    input =<<~TEXT
      5
      20
      220
      222220
      44033055505550666011011111090666077705550301110
      000555555550000330000444000080000200004440000
    TEXT
    expected =<<~TEXT
      a
      b
      b
      hello, world!
      keitai
    TEXT

    assert_equal expected, KeitaiMessage.convert(input)
  end
end
