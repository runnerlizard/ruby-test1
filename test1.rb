# in main:
#		launch f(arr, "-	")
# 		in f(arr, prefix):
# 			- check type of arr
#			- if it is Hash or Array or Range or ComplexItem - launch f(arr[i], '	' + prefix)
#			- else - puts(prefix + )

class ComplexItem
	attr_accessor :title, :items
end

def PrintSimple(str, prefix)
	print "#{prefix}#{str}\n"
end

def InnerArray(arr, tabs)
	if arr.is_a? Array or arr.is_a? Range
		text = "-/Array#{tabs}:"
		for i in 1..tabs
			text.prepend("	")
		end
		puts text
		for el in arr
			InnerArray(el, tabs + 1)
		end	
	elsif arr.is_a? Hash
		text = "-/Hash#{tabs}:"
		for i in 1..tabs
			text.prepend("	")
		end
		puts text
		for el in arr
			InnerArray(el, tabs + 1)
		end
	elsif arr.is_a? ComplexItem
		puts "Complex"
	else
		text = "-/#{arr}"
		for i in 1..tabs
			text.prepend("	")
		end
		puts text
	end	
end

com1 = ComplexItem.new()
com1.title = "Complex 1"
com1.items = 1

com2 = ComplexItem.new()
com2.title = "Complex 2"
com2.items = ['a', 'b', 'c']

ra = 1..9
arr = Array[6, [1, ra, 2], "Hello", true]
InnerArray(arr, 0)
