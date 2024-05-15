class_name GeometryLib
extends Library
# Library for geometry related functions


func get_library_name() -> String: return "GeometryLib"


# Calculate the area of a polygon
# @param polygon: The polygon to calculate the area of
# @return: The calculated area
static func polygon_area(polygon: PackedVector2Array) -> float:
	if not polygon or polygon.is_empty():
		return 0
	
	polygon.append(polygon[0]) # Add first point as end point to close the polygon needed for calculations
	
	var sum1: float = 0
	var sum2: float = 0
	for i in range(polygon.size() - 1):
		var current_point: Vector2 = polygon[i]
		var next_point: Vector2 = polygon[i + 1]
		sum1 += current_point.x * next_point.y
		sum2 += current_point.y * next_point.x
	
	var double_area = sum1 - sum2
	return  0.5 * double_area
