# in main launch f(arr)
# in f: 
# 		- print name of inner array
#		- if 

class ComplexItem
	attr_accessor :title, :items
end

def PrintSimple(str, prefix)
	print "#{prefix}#{str}\n"
end

def InnerArray(arr, prefix)
	for el in arr
		if el.is_a? ComplexItem
			prefix.concat("/#{el}.title}")
			puts prefix
			prefix.prepend("	")
			InnerArray(el.items, prefix)
		else
			print "#{prefix}/#{el}\n"	
		end
	end
end


com1 = ComplexItem.new()
com1.title = "Complex 1"
com1.items = 1

com2 = ComplexItem.new()
com2.title = "Complex 2"
com2.items = ['a', 'b', 'c']


arr = Array[6, com1, "Hello", true]
InnerArray(arr, " -")
