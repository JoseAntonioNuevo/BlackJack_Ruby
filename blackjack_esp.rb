#Blackjack Created by: José Antonio Nuevo

#modulo
module Black

#clase
class Jack

#Getter/Setter
attr_accessor :jugada, :total, :player

#Constructor
def initialice()

@total = 0
@jugada = 0

end

#Jugada 1
def jugada1

@jugada = rand(1..11)

if jugada == 1
	jugada = 11	
end

@total += @jugada

jugada = @jugada

puts "#{jugada}"

end

#Jugada del rival
def rival(player)

	while (player>@total)
		@jugada = rand(1..10)
		@total += @jugada

		jugada = @jugada

		puts "#{jugada}"
	
	if @total==21
		break
		
	end
end

	return @total

end

#Jugada 2
def black_Jack()

@jugada = rand(1..10)

@total += @jugada

jugada = @jugada

puts "#{jugada}"

return @total

end
end
end

#Instancia Clase
jack = Black::Jack.new()

puts "Bienvenido a BlackJack"
puts "¿Como te llamas?"

nombre = gets.chomp.to_s

#Inicialización ArrayList historico
arr = Array.new

punt_jug = 0

punt_riv = 0

#Bucle infinito mientras el usuario quira segir jugando
loop do

jack.initialice

jack.jugada1

total =  jack.black_Jack

while total<21
	
puts "Ahora tienes #{total}"
puts "pulsa 1 para seguir"

opc = gets.chomp.to_i 

if opc==1
	total = jack.black_Jack
	
	else
	   break
end
end

if total>21

	puts "Tienes #{total}, superas 21, has perdido"
	arr.push("Perdido")
	punt_riv += 1
	
elsif total==21

	puts "Blackjack! Has ganado"
	arr.push("Ganado")
	punt_jug += 1

else

	puts "Te has quedado con #{total}, le toca a tu rival"
    
    player = total

    jack.initialice

    jack.jugada1
	
    total =  jack.black_Jack 

    if total != 21

    total = jack.rival(player)
    
    puts "Puntuaciones finales"
    puts "#{nombre}: #{player}"
    puts "Rival: #{total}"

    if (player>total || total>21)

    	puts "Has Ganado!"
    	arr.push("Ganado")
    	punt_jug += 1

    elsif player<total

    	puts "Has perdido"
    	arr.push("Perdido")
    	punt_riv += 1
    
    else

    	puts "Empate"
    	arr.push("Empate")

    end

   else

   	puts "Blackjack del rival!"
   	arr.push("Perdido")
   	punt_riv += 1

    end

end


#Comprobar tamaño del array
size = arr.size

puts ""
puts "Total"
puts "#{nombre}: #{punt_jug}"
puts "Rival: #{punt_riv}"
puts ""


#Historial
puts "Historico:"
for i in(0..size-1)
    puts "#{i+1}- #{arr[i]}"
end
puts ""


#Otra partida
puts "Pulsa 1 para jugar otra vez"
puts "Pulsa qualquier otro para salir"

otra = gets.chomp.to_i

if otra != 1
 puts "Gracias por jugar"
 puts "Hasta la próxima"

 exit
	
end
end