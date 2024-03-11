class_name MathLib
extends Library
# Library for math related functions


func get_library_name() -> String: return "MathLib"


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


# Returns the given vector with the lowest given values applied (i.e. minVect(Vector2(2, 9), 4) -> Vector2(2, 4))
# @param vector: The vector to apply the minimum to
# @param min_amount: The minimum value to compare the vector to
# @result: The vector containing the minimal values
static func minVect(vector: Vector2, min_amount: float) -> Vector2:
	vector.x = minf(vector.x, min_amount)
	vector.y = minf(vector.y, min_amount)
	return vector


# Returns the given vector with the lowest given vector values applied (i.e. minVectV(Vector2(2, 9), Vector2(3, 8)) -> Vector2(2, 8))
# @param vector: The vector to apply the minimum to
# @param min_vector: The minimum vector to compare the vector to
# @result: The vector containing the minimal values
static func minVectV(vector: Vector2, min_vector: Vector2) -> Vector2:
	vector.x = minf(vector.x, min_vector.x)
	vector.y = minf(vector.y, min_vector.y)
	return vector


# Returns the given vector with the highest given values applied (i.e. maxVect(Vector2(2, 9), 4) -> Vector2(4, 9))
# @param vector: The vector to apply the maximum to
# @param max_amount: The maximum value to compare the vector to
# @result: The vector containing the maximum values
static func maxVect(vector: Vector2, max_amount: float) -> Vector2:
	vector.x = maxf(vector.x, max_amount)
	vector.y = maxf(vector.y, max_amount)
	return vector


# Returns the given vector with the highest given vector values applied (i.e. maxVectV(Vector2(2, 9), Vector2(3, 8)) -> Vector2(3, 9))
# @param vector: The vector to apply the maximum to
# @param max_vector: The maximum vector to compare the vector to
# @result: The vector containing the maximum values
static func maxVectV(vector: Vector2, max_vector: Vector2) -> Vector2:
	vector.x = maxf(vector.x, max_vector.x)
	vector.y = maxf(vector.y, max_vector.y)
	return vector
