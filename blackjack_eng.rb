#Blackjack Created by: José Antonio Nuevo

#module
module Black

#class
class Jack

#Getter/Setter
attr_accessor :jugada, :total, :player

#Constructor
def initialice()

@total = 0
@jugada = 0

end

#Turn 1
def jugada1

@jugada = rand(1..11)

if jugada == 1
	jugada = 11	
end

@total += @jugada

jugada = @jugada

puts "#{jugada}"

end

#oponent's turn
def rival(player)

#The risk the oponenet will take to try to beat the player
risk = rand(13..17)

	while (player>@total || @total<risk)
		@jugada = rand(1..10)
		@total += @jugada

		jugada = @jugada
		puts "#{jugada}"

       # if the total overpass the player's score, breaks the loop because the oponent just won
        if @total > player
          	break
        end
		
	
	if @total==21
		break
		
	end
end

	return @total

end

#Trun 2
def black_Jack()

@jugada = rand(1..10)

@total += @jugada

jugada = @jugada

puts "#{jugada}"

return @total

end
end
end

#InstanceClase
jack = Black::Jack.new()

puts "Welcome to BlackJack"
puts "¿What's your name?"

nombre = gets.chomp.to_s

#Historic ArrayList
arr = Array.new

punt_jug = 0

punt_riv = 0

#While the user still playing the loops will contiue
loop do

jack.initialice

jack.jugada1

total =  jack.black_Jack

while total<21
	
puts "You have now #{total}"
puts "Press 1 to continue"
puts "Press any other button to stop"

opc = gets.chomp.to_i 

if opc==1
	total = jack.black_Jack
	
	else
	   break
end
end

if total>21

	puts "You have #{total}, you surpass 21, you lose"
	arr.push("Lost")
	punt_riv += 1
	
elsif total==21

	puts "Blackjack! You won"
	arr.push("Won")
	punt_jug += 1

else

	puts "You have #{total}, oponent's turn"
    
    player = total

    jack.initialice

    jack.jugada1
	
    total =  jack.black_Jack 

    if total != 21

    total = jack.rival(player)
    
    puts "Scores"
    puts "#{nombre}: #{player}"
    puts "Oponent: #{total}"

    if (player>total || total>21)

    	puts "You Won!"
    	arr.push("Won")
    	punt_jug += 1

    elsif player<total

    	puts "You Lost"
    	arr.push("Lost")
    	punt_riv += 1
    
    else

    	puts "Draw"
    	arr.push("Draw")

    end

   else

   	puts "Oponent's Blackjack!"
   	arr.push("Lost")
   	punt_riv += 1

    end

end


#Check the size of the ArrayList
size = arr.size

puts ""
puts "Scores"
puts "#{nombre}: #{punt_jug}"
puts "Oponent: #{punt_riv}"
puts ""


#Historic
puts "Historic:"
for i in(0..size-1)
    puts "#{i+1}- #{arr[i]}"
end
puts ""


#Play again
puts "Press 1 to play again"
puts "Press any other button to exit"

otra = gets.chomp.to_i

if otra != 1
 puts ""	
 puts "Thanks for playing"
 puts "See you next time!"

 exit
	
end
end