# Задача 
# Прямоугольный треугольник. Программа запрашивает у пользователя 
# 3 стороны треугольника 
# и определяет, является ли треугольник прямоугольным, 
# используя теорему Пифагора (www-formula.ru) и 
# выводит результат на экран. 
# Также, если треугольник является при этом равнобедренным 
# (т.е. у него равны любые 2 стороны), 
# то дополнительно выводится информация о том, 
# что треугольник еще и равнобедренный. 
# Подсказка: чтобы воспользоваться теоремой Пифагора, 
# нужно сначала найти самую длинную сторону (гипотенуза) и 
# сравнить ее значение в квадрате с суммой квадратов двух остальных сторон. 
# Если все 3 стороны равны, 
# то треугольник равнобедренный и равносторонний, 
# но не прямоугольный.

puts "Проверка, является ли треугольник прямоугольным"
puts "Введите длину первой стороны треугольника"
a = gets.chomp.to_f
puts "Введите длину второй стороны треугольника" 
b = gets.chomp.to_f
puts "Введите длину третьей стороны треугольника"
c = gets.chomp.to_f

if a > b && a > c  # Сравниваем стороны, ищем гипотенузу.
  hypotenuse = a
  side_two = b
  side_three = c
elsif b > a && b > c
  hypotenuse = b
  side_two = a
  side_three = c
elsif c > a && c > b
  hypotenuse = c
  side_two = b
  side_three = a
end

# Проверяем треугольник 
# на выполнение условий: равносторонний, равнобедренный, прямоугольный

if side_two == side_three && side_three == hypotenuse  
  puts "Треугольник является равносторонним"
elsif side_two == side_three || side_three == hypotenuse
  puts "Треугольник является равнобедренным"
elsif hypotenuse**2 == side_two**2 + side_three**2
  puts "Треугольник является прямоугольным"
else
end 



# triangle = [a, b, c]
# hypotenuse = triangle.max

# if hypotenuse = a && a**2 == b**2 + c**2
#   puts "Треугольник является прямоугольным"
# elsif hypotenuse = b && b**2 == a**2 + c**2
#   puts "Треугольник является прямоугольным"
# elsif hypotenuse = c && c**2 == a**2 + b**2
#   puts "Треугольник является прямоугольным"
# end

# puts "Треугольник является равнобедренным" if a == b || a == c || b == c
# puts "Треугольник является равносторонним" if a == b && a == c
  

