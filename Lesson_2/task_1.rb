# 1. Сделать хеш, содеращий месяцы и количество дней в месяце. 
# В цикле выводить те месяцы, у которых количество дней ровно 30

list_of_months = {
                  "January"   => 31,
                  "February"  => 28,
                  "March"     => 31,
                  "April"     => 30,
                  "May"       => 31,
                  "June"      => 30,
                  "July"      => 31,
                  "August"    => 31,
                  "September" => 30,
                  "October"   => 31,
                  "November"  => 30,
                  "December"  => 31
}

puts "List of months with 30 days: "

list_of_months.each_pair do |month, days| #замены each на each_pair
  if days == 30
    puts "#{month}\n"
  end
end

