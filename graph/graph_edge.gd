class_name GraphEdge extends Resource

var neighbor
var weight: int

#Constructor, Time O(1) Space O(1)
func _init(_neighbor, _weight):
	self.neighbor = _neighbor
	self.weight = _weight
 
#Time O(1) Space O(1)
func _to_string() -> String:
	return "(" + str(neighbor) + "," + str(weight) + ")"
