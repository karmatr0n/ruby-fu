def spreadsheet_encode_column(str)
    num = 0
    left_most_digit = str.length - 1
    base = 26
    str.each_char do |c|
        num += base ** left_most_digit * (c.ord - 'A'.ord + 1)
        left_most_digit -= 1
    end
    return num
end

puts(spreadsheet_encode_column("ZAZ"))
