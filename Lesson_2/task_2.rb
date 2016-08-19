# 2. Заполнить массив числами от 10 до 100 с шагом 5

# Преределал, используя итератор step
arr_nums = []
10.step(100, 5) { |i| arr_nums.push i } # замена << => push
puts arr_nums

# Старый вариант
# i = 5
# arr_nums = []

# while i <= 100 do 
#   arr_nums << i
#   i += 5
# end

# puts arr_nums
