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

  # 数値を変換し、文字列を返す
  def convert(rows)
    split_rows(rows)
      .map{|row| convert_row(split_row(row))}
      .join("\n")
  end

  private

  # 入力を行ごとに分割し、テストケースの数に応じて切り出す
  def split_rows(rows)
    lines = rows.split("\n")
    count = lines[0].to_i
    lines[1..count]
  end

  # 行を0で区切り、空文字列を除外
  def split_row(row)
    raise ArgumentError, "Invalid input: #{row}" unless row.match?(/\A\d+(0\d+)*\z/)
    row.split('0').reject(&:empty?)
  end

  # 行を文字に変換する
  def convert_row(row)
    row.map {|col| convert_col(col)}.join
  end

  # 行の要素を文字に変換する
  def convert_col(col)
    key = col[0]
    count = col.length
    assn = ASSN[key] || []
    assn[count % assn.length - 1]
  end
end
