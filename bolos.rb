marcador=Array.new(10)  {Array.new(2) }
resultado=Array.new(10)

for i in 0..9
	for j in 0..1

		tiro = rand(0..10)
		marcador[i][j] = tiro
		
	end
	# poner nill en el segundo tiro despues de strike
	if marcador[i][0] == 10 
		marcador[i][1] = 0
	end

end

for i in 0..9

	#strike
	if marcador[i][0] == 10  
		if i<9
		resultado[i] = marcador[i][0] + marcador[i+1][0] + marcador[i+1][1]
		else
		resultado[i] = marcador[i][0] + rand(0..10) + rand(0..10)
		end

	#spare 
	elsif marcador[i][0] != 10 && marcador[i][1] == 10 
		if i<9
			resultado[i] = marcador[i][0] + marcador[i][1] + marcador[i+1][0]
		else
			resultado[i] = marcador[i][0] + marcador[i][1] + rand(0..10)
		end
	#lo demas
	else 
		resultado[i] = marcador[i][0] + marcador[i][1]
	
	end
end

# cuadro a mostrar
muestra = marcador
for i in 0..9
	for j in 0..1
		if muestra[i][1] ==  10
			muestra[i][1] = "/"
		elsif muestra[i][0] == 10
			muestra[i][0] = "x"
			muestra[i][1] = "nil"	
		end
	end

end
puts "Cuadro: "
muestra.each do |valores|
	puts "#{valores} "

end

#puntuaciones
total=0
print"Puntuaciones:"
resultado.each do |valores|
	total += valores
print "#{[valores] }"
end
puts "\nTotal: #{total}"