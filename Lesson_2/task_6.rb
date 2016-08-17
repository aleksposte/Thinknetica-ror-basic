# 6. Сумма покупок. 
# Пользователь вводит поочередно название товара, 
# цену за единицу и 
# кол-во купленного товара (может быть нецелым числом). 
# Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара. 
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, 
# ключами которого являются названия товаров, 
# а значением - вложенный хеш, 
# содержащий цену за единицу товара и кол-во купленного товара. 
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран 
# итоговую сумму всех покупок в "корзине".

 
list_products = {}
cost_of_product = {}
all_products = {}

product_name = 0
product_price = 0
product_amount = 0
sum_all_products = 0

# Получаем данные от пользователя
loop do 
  puts "Ввведите название товара" 
  product_name = gets.chomp

  break if product_name == "стоп" 
   
  puts "Ввведите стоимость товара"
  product_price = gets.chomp.to_f
  puts "Ввведите кол-во товара"
  product_amount = gets.chomp.to_f

  # Записываем в hash
  list_products[product_name] = { product_price => product_amount } 
  # puts list_products

  # Считаем суммы (по товару и полную)
  cost_of_product[product_name] = product_price * product_amount
  sum_all_products += product_price * product_amount
end

puts "Вы ввели 'стоп', подсчет товаров закончен, в вашей корзине:"

puts "Список товаров #{list_products}"

cost_of_product.each do |amount, sum|
  puts "Сумма за товар #{amount} равна: #{sum}"
end

puts "Итоговая сумма за товары равна: #{sum_all_products}"