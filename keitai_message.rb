module KeitaiMessage
  extend self

  HASH = {
    '1' => ['.', ',', '!', '?', ' '],
    '2' => ['a' ,'b' ,'c'],
    '3' => ['d' ,'e' ,'f'],
    '4' => ['g' ,'h' ,'i'],
    '5' => ['j' ,'k' ,'l'],
    '6' => ['m' ,'n' ,'o'],
    '7' => ['p' ,'q' ,'r' ,'s'],
    '8' => ['t' ,'u' ,'v'],
    '9' => ['w' ,'x' ,'y' ,'z'],
  }.freeze

  def convert(nums)
    splited_nums = split_nums(nums)
    converted_nums = convert_nums(splited_nums)
  end

  private

  def split_nums(nums)
    nums.split('0').reject(&:empty?)
  end

  def convert_nums(splited_nums)
    chars = generate_chars(splited_nums)
    chars.join
  end

  def generate_chars(splited_nums)
    splited_nums.map do |s|
      words = HASH[s[0]]
      words[s.size % words.size - 1]
    end
  end
end
