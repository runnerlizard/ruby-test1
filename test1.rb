# in main:
#		launch f(arr, "-	")
# 		in f(arr, prefix):
# 			- check type of arr
#			- if it is Hash or Array or Range or ComplexItem - launch for each el f(el, tab + 1)
#			- else - puts number of tabs

class ComplexItem
	attr_accessor :title, :items
end


def InnerArray(arr, tabs, prefix)
	if arr.is_a? Array or arr.is_a? Range
		text = prefix.dup
		for i in 1..tabs
			text.prepend("	")
		end
		puts text
		for el in arr
			InnerArray(el, tabs + 1, text)
		end
	elsif arr.is_a? Hash
		text = "-/Hash#{tabs}"
		for i in 1..tabs
			text.prepend("	")
		end
		puts text
		for el in arr
			InnerArray(el, tabs + 1, text)
		end
	elsif arr.is_a? ComplexItem
		text = prefix.dup
		text.concat("/" + arr.title)
		for i in 1..tabs
			text.prepend("	")
		end
		puts text
		InnerArray(arr.items, tabs + 1, text)
	else
		text = prefix.dup
		text.concat("/")
		text.concat(arr.to_s)
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

com3 = ComplexItem.new()
com3.title = "Complex 3"
com3.items = [com1, com2]

ra = 1..9
arr = Array[6, true, com1, "df", com2, "dsd", com3]
InnerArray(arr, 0, "-")
