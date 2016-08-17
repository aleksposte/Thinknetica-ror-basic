# 4. Заполнить хеш гласными буквами, 
# где значением будет являтся 
# порядковый номер буквы в алфавите (a - 1).


#  'a','e','i','o','u' Список гласных букв в алфавите.

arr_letters = ('a'..'z').to_a 

hash_letters = {}
arr_letters.each_with_index do |value, index| # Проход массива по значениея (буквы)
  
  if value == 'a' || value == 'e' || value == 'i' || value == 'o' || value == 'u'
    hash_letters[value] = 1 + index
  end

end

puts "Номера гласных букв в алфавите: #{hash_letters}"