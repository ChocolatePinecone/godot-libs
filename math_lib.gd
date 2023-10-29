class_name MathLib
extends Library
# Library for math related functions


func get_class() -> String: return "MathLib"


# Generate a random integer with a fixed length
# @param length: The required length of the random number
# @return: The randomly generated integer
static func random_int_with_length(length: int) -> int:
	var from = 1
	var to = 10
	for _i in range(length - 1):
		from *= 10
		to *= 10
	
	var random_int = randi()
	var result = random_int % to
	if result < from:
		result += from
		
	return result


# Natural logarithm with a base of 10, used to determine the amount of times a multiplication of 
# 10 was applied
# @param value: The value perform the logarithmic operation on
# @result: The answer of the logarithmic operation
static func log10(value: float) -> float:
	return log(value) / log(10)


# Sums all elements of an array and return the result
# @param value: The array of elements to sum
# @result: The answer of the sum as a float
static func sumArray(array: Array) -> float:
	var sum: float = 0
	for elem in array:
		assert(elem is float or elem is int, 
			"Array element {0} cannot be summed because it is not a number".format([elem]))
		sum += elem
	return sum
