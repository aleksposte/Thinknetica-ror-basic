

# Старый вариант:

# Изменил место определения arr_i 
i_prev = 0
i_cur = 1
arr_i = []

puts "Массив с числами фибоначи до 100:"
while i_cur < 100 do 
  sum_i = i_prev + i_cur

  arr_i.push sum_i

  i_prev = i_cur
  i_cur = arr_i.last
  
end
puts arr_i


# Вариан с loop

# i_cur = 1
# i_prev = 0
# arr_i = []

# loop do
  
#   sum_i = i_prev + i_cur
#   arr_i << sum_i

#   i_prev = i_cur
#   i_cur = arr_i.last  
#   break if arr_i.last > 100
# end
# puts arr_i