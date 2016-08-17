# 3. Заполнить массив числами фибоначи до 100

  i_prev = 0
  i_cur = 1
  puts "Массив с числами фибоначи до 100:"
while i_cur < 100 do 
  sum_i = i_prev + i_cur

  arr_i = []
  arr_i << sum_i

  i_prev = i_cur
  i_cur = arr_i.last
  puts arr_i
end


# Вариан с loop

# loop do
  
#   sum_i = i_prev + i_cur

#   arr_i = []
#   arr_i << sum_i

#   i_prev = i_cur
#   i_cur = arr_i.last
#   puts arr_i
#   break if arr_i.last > 100
  
# end