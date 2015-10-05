require 'matrix'

class Matrix       #an easy way to change the content of Matrix
  def []=(i,j,x)
    @rows[i][j]=x
  end
end
# def generate_array n
# 	arr=Array.new(n) 
# 	arr[0]=(1..n).to_a
# 	(0..n-1).each do |i|
# 		arr[i]=arr[0].map{|m| m+i}
# 	end
# 	arr
	
# end
def grade_schol_matrix_multi n, matx_a, matx_b  #return value is the multiplication result
	result=Matrix.zero n 
	for i in 0..n-1
		for j in 0..n-1
			for k in 0..n-1
				result[i,j]=result[i,j]+matx_a[i,k]*matx_b[k,j]
			end
		end
	end
	return result


end
# p generate_array 4


# puts mat1
# puts mat1[0,0]


# a=gets.chomp()

$global_n=2 #Define the size of the Matrix
$count_iteration=0  #Describe the number of invoking method  Strassen

def input n, matx    #input a matrix, the second parameter is an object of class Matrix
	for i in 0..n-1 do
		puts "Please input line  #{i+1}"
		for j in 0..n-1 do
		matx[i,j]=gets.chomp.to_f
		end
	end
	puts "your have finish the input of Matrix" 
end

def output n, matx   #output a matrix, the second parameter is an object of class Matrix
	puts "The output Matrix is :"
	for i in 0..n-1 do
		for j in 0..n-1 do
		print "#{matx[i,j]}  "
		end
		puts ""
	end
end

def Strassen n,matx_a,matx_b,matx_c
	$count_iteration=$count_iteration+1
    puts "Invoking Strassen  time: #{$count_iteration}"
	a11=Matrix.zero n/2
	a12=Matrix.zero n/2
	a21=Matrix.zero n/2
	a22=Matrix.zero n/2
	b11=Matrix.zero n/2
	b12=Matrix.zero n/2
	b21=Matrix.zero n/2
	b22=Matrix.zero n/2
	c11=Matrix.zero n/2
	c12=Matrix.zero n/2
	c21=Matrix.zero n/2
	c22=Matrix.zero n/2
	m1=Matrix.zero n/2
	m2=Matrix.zero n/2
	m3=Matrix.zero n/2
	m4=Matrix.zero n/2
	m5=Matrix.zero n/2
	m6=Matrix.zero n/2
	m7=Matrix.zero n/2
	aa=Matrix.zero n/2
	bb=Matrix.zero n/2

	if n==2 
		matx_c=matx_a*matx_b
		return matx_c
		#seprate matx_a and metx_b become four sub_metrix.
	else
		for i in 0..(n/2-1) do
			for j in  0..(n/2-1) do
				a11[i,j]=matx_a[i,j]
				a12[i,j]=matx_a[i,j+n/2]
				a21[i,j]=matx_a[i+n/2,j]
				a22[i,j]=matx_a[i+n/2,j+n/2]
				puts "----------get four sub_metrix-----------"
				b11[i,j]=matx_b[i,j]
				b12[i,j]=matx_b[i,j+n/2]
				b21[i,j]=matx_b[i+n/2,j]
				b22[i,j]=matx_b[i+n/2,j+n/2]
				puts "----------get four sub_metrix-----------"
			end

		end
		#Calculate m5=(a11+a22)*(b11+b22)
		aa=a11+a22
		bb=b11+b22
		m5=Strassen n/2 ,aa,bb,m5
		#Calculate m3=(a21+a22)*b11
		aa=a21+a22
		m3=Strassen n/2 ,aa,b11,m3
		#Calculate m1=a11*(b12-b22)
		bb=b12-b22
		m1=Strassen n/2 ,a11,bb,m1
		#Calculate m4=a22*(b21-b11)
		bb=b21-b11
		m4=Strassen n/2 ,a22,bb,m4
		#Calculate m2=(a11+a12)*b22
		aa=a11+a12
		m2=Strassen n/2 ,aa,b22,m2
		#Calculate m6=(a12-a22)*(b21+b22)
		aa=a12-a22
		bb=b21+b22
		m6=Strassen n/2 ,aa,bb,m6
		#Calculate m7=(a11-a21)(b11+b12)
		aa=a11-a21
		bb=b11+b12
		m7=Strassen n/2 ,aa,bb,m7

		#Calculate c11=m4+m5+m6-m2
		c11=m4+m5+m6-m2
		#Calculate c12=m1+m2
		c12=m1+m2
		#Calculate c21=m3+m4
		c21=m3+m4
		#Calculate c22=m1+m5-m3-m7
		c22=m1+m5-m3-m7

		#set the result to matx_c
		for i in 0..(n/2-1) 
			for j in 0..(n/2-1) do
				matx_c[i,j]=c11[i,j]
				matx_c[i,j+n/2]=c12[i,j]
				matx_c[i+n/2,j]=c21[i,j]
				matx_c[i+n/2,j+n/2]=c22[i,j]
			end
		end
		return matx_c
	end

end


mat1=Matrix.zero $global_n
mat2=Matrix.zero $global_n
result=Matrix.zero $global_n
puts "----please input the first Matrix----"
input $global_n,mat1
puts "----please input the second Matrix----"
input $global_n,mat2
result=Strassen $global_n ,mat1,mat2 ,result
output $global_n,result

puts "invoke ruby inside Matrix multiplication result:"
puts mat1*mat2
puts "Grade-school result:"
puts grade_schol_matrix_multi $global_n ,mat1,mat2