# define a class
class Box
   #initialize class variable
   @@count=0
   # constructor method
   def initialize(w,h)
      @width, @height = w, h
      @@count+=1
   end

   # accessor methods
   def getWidth
      @width
   end
   def getHeight
      @height
   end

   # setter methods
   def setWidth(value)
      @width = value
   end
   def setHeight(value)
      @height = value
   end
   def self.printCount()
	puts "Box count is: #@@count"
   end
   def to_s
       "(w:#@width,h:#@height)"
   end
end

# create an object
box = Box.new(10, 20)
box2= Box.new(50,60)
# use setter methods
box.setWidth (30)
box.setHeight (50)


# use accessor methods
x = box.getWidth()
y = box.getHeight()

puts "Width of the box is : #{x}"
puts "Height of the box is : #{y}"

Box.printCount()
puts "String representaion of box is: #{box}"
puts "String representaion of box is: #{box2}"
