class_name Library
extends Object
# Base class for libraries
# Handles basic library related matters


# Virtual function to override. This function is needed for logging when an error occurs here
func get_library_name() -> String:
	return "Undefined Library"


func _init():
	var name = get_library_name()
	assert(
		false, 
		("{0} is not supposed to be initialized. Please use its library functions "
		+ "directly instead, like \"{0}.libfunc(arg)\"").format([name])
	)
