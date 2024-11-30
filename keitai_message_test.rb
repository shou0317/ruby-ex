require 'minitest/autorun'
require_relative 'keitai_message'

class TestKeitaiMessage < Minitest::Test
  # def test_convert_number_to_string
  #   input =<<~TEXT
  #     5
  #     20
  #     220
  #     222220
  #     44033055505550666011011111090666077705550301110
  #     000555555550000330000444000080000200004440000
  #   TEXT
  #   expected =<<~TEXT
  #     a
  #     b
  #     b
  #     hello, world!
  #     keitai
  #   TEXT

  #   assert_equal expected, KeitaiMessage.convert(input)
  # end

  # simple test
  def test_convert_number_to_string
    assert_equal 'a', KeitaiMessage.convert('20')
    assert_equal 'b', KeitaiMessage.convert('220')
    assert_equal 'b', KeitaiMessage.convert('222220')
    assert_equal 'hello, world!', KeitaiMessage.convert('44033055505550666011011111090666077705550301110')
    assert_equal 'keitai', KeitaiMessage.convert('000555555550000330000444000080000200004440000')
  end
end
