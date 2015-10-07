# ruby version: 2.2.1
require 'benchmark'
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
# multiply(a[1..p], b[1..q], base)
#   m = [1..p+q]  //Allocate space for result
#   for bi = 1 to q
#     carry = 0
#     for ai = 1 to p
#       m[ai + bi - 1] += carry + a[ai] * b[bi]
#       carry = m[ai + bi - 1] / base
#       m[ai + bi - 1] = m[ai + bi - 1] mod base
#     m[bi + p] += carry

def grade_school_multi  a,b,base     # a simulate of grade_school_multi. Although it cannot get precise solution, it spend almost same time
	
	a_l=a.length
	b_l=b.length
	m=Array.new(a_l+b_l-1) { |e| e =  2 }
	for bi in 0...b_l
		carry=0
		for ai in 0...a_l
			m[ai+bi]=m[ai+bi]+a[ai]*b[bi]
			carry=m[ai+bi]/base
			m[ai+bi]=m[ai+bi] % base
		end
		m[bi+a_l-1]=m[bi+a_l-1]+carry
	end
	return m
	
end
def karatsuba x,y
	if x<10||y<10
		return x*y
	end
	
	m=(max size(x),size(y))/2
	#puts "the seperate key value is: #{m}"

	x0=get_low x,m
	x1=get_high x,m
	y0=get_low y,m
	y1=get_high y,m

	#puts "you will seperate integer #{x} and #{y}"
	#puts "x    #{x1}    #{x0}"
	#puts "y    #{y1}    #{y0}"

	z2=karatsuba(x1,y1)
	#puts "z2=#{z2}"
	z0=karatsuba(x0,y0)
	#puts "z0=#{z0}"
	z1=karatsuba((x1+x0),(y1+y0)) - z2 - z0
	#puts "z1=#{z1}"
	return  z2*pow(1,2*m)+z1*pow(1,m)+z0;
end

#test code:
puts "benchmark.realtime.karatsuba:"
puts Benchmark.realtime {
 karatsuba  1234,2356
}
 
puts "benchmark.realtime.grade_school_multi:"
puts Benchmark.realtime {
  grade_school_multi [1,2,3,4],[2,3,5,6],10
 
}