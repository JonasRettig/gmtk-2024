class_name GraphEdge extends Resource

var neighbor
var weight: int


#Constructor, Time O(1) Space O(1)
@warning_ignore("shadowed_variable")
func _init(neighbor, weight):
	self.neighbor = neighbor
	self.weight = weight
 
#Time O(1) Space O(1)
func _to_string() -> String:
	return "(" + str(self.neighbor) + "," + str(self.weight) + ")"
