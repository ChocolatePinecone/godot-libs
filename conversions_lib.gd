class_name ConversionsLib
extends Library
# Library for converting data
# Provides functions for converting data from one format to another


func get_library_name() -> String: return "ConversionsLib"


# Converts a Dictionary and its sub-dictionaries to a json string.
# @param dict: The Disctionary with data to convert
# @returns: A json string containing all the converted data
static func dictionary_to_json(dict : Dictionary) -> String:
	return JSON.print(dict)


# Converts json file data to a Dictionary of sub-dictionaries.
# @param json_text: The json text with data to convert
# @returns: A Dictionary containing sub-dictionaries for each element
static func json_to_dictionary(json_text : String) -> Dictionary:
	var json = JSON.parse(json_text)
	
	if(json.error):
		printerr("Error while converting json file")
		
	var dict = json.result
	assert(
		dict is Dictionary, 
		"Unexpected JSON format. Expected JSON to be surrounded with curly braces: " 
			+ StringLib.quotify("{}")
	)
	
	return dict


# Converts json file data to an Array of dictionaries.
# @param json_file: The json file with data to convert
# @returns: An array containing a dictionary for each element
static func json_to_array(json_text : String) -> Array:
	var json = JSON.parse(json_text)
	
	if(json.error):
		printerr("Error while converting json file")
		
	var array = json.result
	assert(
		array is Array, 
		"Unexpected JSON format. Expected JSON to be surrounded with brackets: " 
			+ StringLib.quotify("[]")
	)
	
	return array


# Converts Vector2 to a String representation where the values are seperated by an "x"
# Example: Vector2(1024, 576) -> "1024x576"
# @param v: The Vector2 to convert
# @returns: A String containing the values seperated by an "x"
static func vector2_to_string(v : Vector2) -> String:
	return str(v.x) + "x" + str(v.y)
