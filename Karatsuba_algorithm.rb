# ruby version: 2.2.1
def pow num,n # return num*10^n
	sum=1
	for i in 0...n
		sum=sum*10
	end
	return num*sum
end

def size x  #get x contains how many bits.
	count=x.to_s.length
	return count
		
end

def max x,y #get the bigger one 
	if x>=y
		return x
	else return y
	end
end

def get_high x,m
	return x/pow(1,m)
end
def get_low x,m
	a=get_high x,m 
	return x-a*pow(1,m)
end

def karatsuba x,y
	if x<10||y<10
		return x*y
	end
	
	m=(max size(x),size(y))/2
	puts "the seperate key value is: #{m}"

	x0=get_low x,m
	x1=get_high x,m
	y0=get_low y,m
	y1=get_high y,m

	puts "you will seperate integer #{x} and #{y}"
	puts "x    #{x1}    #{x0}"
	puts "y    #{y1}    #{y0}"

	z2=karatsuba(x1,y1)
	puts "z2=#{z2}"
	z0=karatsuba(x0,y0)
	puts "z0=#{z0}"
	z1=karatsuba((x1+x0),(y1+y0)) - z2 - z0
	puts "z1=#{z1}"
	return  z2*pow(1,2*m)+z1*pow(1,m)+z0;
end

#test code:
# a= pow 23 ,3
# puts size 4560000232
puts "#{karatsuba 1234 ,56789}"
puts 1234*56789

puts 5/2.0