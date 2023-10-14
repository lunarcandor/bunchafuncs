# array_wrapped()
# Get an out of bounds item or index from an array. It wraps the index over or under until it gets a value that is in the array. By default it returns the item at the index, but optionally can return just the index.
# Arg 1: Int, The index you want to get
# Arg 2: Array, An array
# Arg 3: Bool, default False, Whether only the index should be returned

# array_clamped()
# Select from an array clamping the index to its bounds. This is essentially just arr[clamp(index,0,arr.size())], but I think it makes the code look cleaner. By default it returns the item at the index, but optionally can return just the index.
# Arg 1: Int, The index you want to get
# Arg 2: Array, An array
# Arg 3: Bool, default False, Whether only the index should be returned

# arrays_in_one()
# Returns items that are only in one of the arrays. The argument is an array of arrays.
# Arg 1: Var, What to look for
# Arg 2: Array, An array of arrays

# arrays_in_none()
# Checks if an item is not in any of the arrays.
# Arg 1: Var, What to look for
# Arg 2: Array, An array of arrays

# array_merge()
# Merges multiple arrays.
# Arg: Array, An array of arrays

func array_wrapped(index:int,array:Array,index_only:bool = false):
	var arr_size = array.size() - 1
	if not index in range(arr_size):
		while index not in range(0,arr_size):
			index = index - arr_size if index > arr_size else index + arr_size
	return array[index] if not index_only else index

func array_clamped(index:int,array:Array,index_only:bool = false):
	index = clamp(index,0,array.size() - 1)
	return index if index_only else array[index]

func arrays_in_all(array_array:Array[Array]) -> Array:
	var unique:Array = []
	for array in array_array:
		for array_item in array:
			var in_all = true
			for array_again in array_array:
				if not array_again.has(array_item):
					in_all = false
					break
			if in_all and not unique.has(array_item):
				unique.append(array_item)
	return unique

func arrays_in_one(array_array:Array[Array]) -> Array:
	var unique:Array = []
	var merged:Array = []
	for array in array_array:
		for array_item in array:
			merged.append(array_item)
	for array_item in merged:
		if merged.count(array_item) == 1:
			unique.append(array_item)
	return unique

func arrays_in_none(look_for,array_array:Array[Array]) -> bool:
	for array in array_array:
		if array.has(look_for):
			return false
	return true

func arrays_merge(array_array:Array[Array],unique:bool = false) -> Array:
	var merged:Array = []
	for array in array_array:
		for array_item in array:
			if unique == false or (unique and not merged.has(array_item)):
				merged.append(array_item)
	return merged
