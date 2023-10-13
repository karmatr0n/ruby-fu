def integer_to_string(input_int)
    if input_int.negative?
        is_negative = true
        input_int = -(input_int)
    else
        is_negative = false
    end

    output_str = ''
    if input_int.zero?
        output_str << '0'
    else
        while input_int > 0 do
            output_str << ('0'.ord + input_int % 10).chr
            input_int /= 10
        end
        output_str.reverse!
    end

    if is_negative
        return '-' + output_str
    else
        return output_str
    end
end

puts(integer_to_string(123))
puts(integer_to_string(-123))
