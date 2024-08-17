extends Node2D
class_name Tile_Type

@export
var type_name : String
@export
var rotation_degree : int

enum Direction {Up, Down, Left, Right}

# 0 -> car_n_w
# 1 -> car_n_s
# 2 -> car_n_e
# 3 -> car_w_e
# 4 -> car_w_s
# 5 -> car_s_e

var connections : Array = [
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false
]
			
func rotate_tile(_rotation_degree : int, _connections : Array):
	for i in float(_rotation_degree) /90:
		for x in _connections:
			if(_connections[x] == true):
				rotate_connection(x)
			
func rotate_connection(connection : int):
	match connection:
		0:
			connections[connection] = false
			connections[2] = true
		1:
			connections[connection] = false
			connections[3] = true
		2:
			connections[connection] = false
			connections[5] = true
		3:
			connections[connection] = false
			connections[1] = true
		4:
			connections[connection] = false
			connections[0] = true
		5:
			connections[connection] = false
			connections[4] = true
		6:
			connections[connection] = false
			connections[8] = true
		7:
			connections[connection] = false
			connections[9] = true
		8:
			connections[connection] = false
			connections[11] = true
		9:
			connections[connection] = false
			connections[7] = true
		10:
			connections[connection] = false
			connections[6] = true
		11:
			connections[connection] = false
			connections[10] = true

func has_connection(direction: Direction) -> bool:
	match direction:
		Direction.Up:
			return connections[0] or connections[1] or connections[2]
		Direction.Down:
			return connections[1] or connections[4] or connections[5]
		Direction.Left:
			return connections[0] or connections[3] or connections[4]
		Direction.Right:
			return connections[2] or connections[3] or connections[5]
		
	
	return false

func _to_string() -> String:
	return type_name
