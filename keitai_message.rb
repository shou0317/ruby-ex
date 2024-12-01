module KeitaiMessage
  extend self

  ASSN = {
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

  def convert(rows)
    splited_rows = split_rows(rows)
    splited_row = splited_rows.map{|row| split_row(row)}
    converted_row = splited_row.map{|row| convert_row(row)}
    converted_rows = converted_row.join("\n")
  end

  private

  def split_rows(rows)
    rows.split("\n").drop(1)
  end

  def split_row(row)
    row.split('0').reject(&:empty?)
  end

  def convert_row(row)
    converted_col = convert_col(row)
    converted_row = converted_col.join
  end

  def convert_col(row)
    row.map do |col|
      assn = ASSN[col[0]]
      assn[(col.size % assn.size) - 1]
    end
  end
end
