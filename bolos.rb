marcador=Array.new(10) {Array.new(2,rand(0..10)) } 

resultado=Array.new(10) #resultado=[]

#suma de los cuadros
for i in 0..9
	#strike
	if marcador[i][0] == 10  
		if i < 9
			if marcador[i+1][0] == 10 #todo strikes
				resultado[i] = marcador[i][0] + marcador[i+1][0] + marcador[i+1][0]
			else
				resultado[i] = marcador[i][0] + marcador[i+1][0] + marcador[i+1][1]
			end
		else
			resultado[i] = marcador[i][0] + rand(0..10) + rand(0..10)
		end

	#spare 
	elsif marcador[i][0] != 10 && marcador[i][1] == 10 
		if i < 9
			resultado[i] = marcador[i][0] + marcador[i][1] + marcador[i+1][0]
		else
			resultado[i] = marcador[i][0] + marcador[i][1] + rand(0..10)
		end
	#lo demas
	else
		resultado[i] = marcador[i][0] + marcador[i][1]
	end
end

# marcador a mostrar
cuadro = Array(marcador)
for i in 0..9
	for j in 0..1
		if cuadro[i][1] ==  10
			cuadro[i][1] = "/"
		elsif cuadro[i][0] == 10
			cuadro[i][0] = "x"
			cuadro[i][1] = "nil"	
		end
	end

end

puts "Cuadro: "
cuadro.each do|valores|
	print "#{valores} "
end

# resultados

total=0
puts "\nResultado: "
resultado.each do |valores|
	total += valores
	print "[#{valores}] " 
end
puts "\nTotal: #{total}"