def minimal_heaviest_subset(weights)
    weights.sort!
    half_sum = weights.sum / 2
    weights
        .each_cons(2)
        .filter {|a, b| a+b >= half_sum}
        .flatten
        .uniq
end

arr = [3,7,5,6,2]
#arr = [5,4,2,5,1,6]
#arr = [3,7,5,6,2,1,8,9,11,12, 4,24,100, 10]
puts minimal_heaviest_subset(arr).inspect
