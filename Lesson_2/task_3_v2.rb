# 3. Заполнить массив числами фибоначи до 100


# Можно было оттолкнуться от идеи: arr_i = [0, 1] 
# и юзать два последних элемента 
# через отрицательные индексы: arr_i[-1] и arr[-2].

# Сделал по рекомендации (надеюсь правильно понял комментарий):

arr_i = [0, 1]

while arr_i[-1] < 100

  arr_i.push(arr_i[-2] + arr_i[-1])
  puts arr_i[-1]

end