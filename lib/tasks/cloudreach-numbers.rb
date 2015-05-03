#! /usr/bin/env ruby

def bucksfizz
  (1..100).each do |num|

    if (num % 3 == 0) and (num % 5 == 0)
      puts "BucksFizz"
    elsif num % 3 == 0
      puts "Bucks"
    elsif num % 5 == 0
      puts "Fizz" 
    else
      puts num
    end
  end
end

# Run the code if executed directly from shell
if __FILE__ == $0
  
  bucksfizz

end #if __FILE__ == $0

