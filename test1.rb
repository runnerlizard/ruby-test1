# in main:
#		launch InnerArray(arr, 0, "-"),
#			arr - input (should be any simple var or array or hash or range or ComplexIten class)
#			0 - current number of tabulations,
#			"-" - initial prefix
# in function:
# 			- check type of arr
#			- for complex elements - recursion call of InnerFunction
#				(Array, Range, Hash - standarts, ComplexItem - sample type)
#			- for simple elements - compile current output with tabs and path ant puts


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
		arr.each do |key, value|
    		text = prefix.dup
			text.concat("/" + key)
			for i in 1..tabs
				text.prepend("	")
			end
			puts text
			if value.is_a? ComplexItem or value.is_a? Array or value.is_a? Hash
				for el in value
					InnerArray(el, tabs + 1, text)
				end
			else
				InnerArray(value, tabs + 1, text)
			end
		end
	elsif arr.is_a? ComplexItem
		text = prefix.dup
		text.concat("/" + arr.title)
		for i in 1..tabs
			text.prepend("	")
		end
		puts text
		if arr.items.is_a? ComplexItem or arr.items.is_a? Array or arr.items.is_a? Hash
			for el in arr.items
				InnerArray(el, tabs + 1, text)
			end
		else
			InnerArray(arr.items, tabs + 1, text)
		end
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
com3.items = [com1, com2, 33]

h = {"first" => [34, 36], "second" => 35}

ra = 1..9
arr = Array[ra, 6, [100, 200], true, com1, "df", com2, "dsd", com3, h]

InnerArray(arr, 0, "-")
