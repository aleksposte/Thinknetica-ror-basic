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
product_name = 0
product_price = 0
product_amount = 0
cost_of_product = 0
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

# Записываем в hash, считаем стоимость за один товар.
# Решение не мое :(, сделано с помощью Анны Селивановой, сам не 
# додумался как реализовать "if !list_products[product_name]"

list_products[product_name] = Hash.new(0) unless list_products[product_name]
list_products[product_name][:price] = product_price
list_products[product_name][:amount] += product_amount
list_products[product_name][:cost_of_product] = product_price * list_products[product_name][:amount]

# Считаем полную сумму товаров:
sum_all_products += product_price * product_amount
end

puts "Вы ввели 'стоп', подсчет товаров закончен, в вашей корзине:"
puts "Список товаров #{list_products}"

list_products.each_pair do |name, sum|
  puts "Сумма за #{name} равна #{sum[:cost_of_product]}"
end

puts "Итоговая сумма за товары равна: #{sum_all_products}"