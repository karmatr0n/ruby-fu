# Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).
# @param {String} s
# @return {Integer}

INT_MIN = -(2 ** 31)
INT_MAX = 2** 31 - 1
def my_atoi(s)
    input_str = s.strip.scan(/^(-|\+)?(\d+)/).join
    is_negative = input_str.match?(/^-/)
    input_str = input_str[1..-1] if input_str.match?(/^(-|\+)/)
    base = 10
    output_int = 0
    most_significant_digit = input_str.length - 1
    input_str.each_char do |char|
        output_int += (char.ord - '0'.ord) * base ** most_significant_digit
        most_significant_digit -=1
    end

    output_int = -(output_int) if is_negative

    return INT_MIN if output_int < INT_MIN
    return INT_MAX if output_int > INT_MAX
    return output_int

    # Time complexity = O(n)
    # Space complexity = O(1)
end
