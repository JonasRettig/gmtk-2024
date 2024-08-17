extends Tile
class_name Tile_Type

@export
var type_name : String
@export
var rotation_degree : int

# 0 -> car_n_w
# 1 -> car_n_s
# 2 -> car_n_e
# 3 -> car_w_e
# 4 -> car_w_s
# 5 -> car_s_e
# 6 -> train_n_w
# 7 -> train_n_s
# 8 -> train_n_e
# 9 -> train_w_e
# 10 -> train_w_s
# 11 -> train_s_e

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

func _init(_tile_name : String = "", _rotation_degree := 0):
	type_name = _tile_name
	match type_name:
		"Hub":
			connections[0] = true
			connections[1] = true
			connections[2] = true
			connections[3] = true
			connections[4] = true
			connections[5] = true
		"Gerade":
			connections[1] = true
			_rotate_tile(_rotation_degree, connections)
		"Kurve":
			connections[0] = true
			_rotate_tile(_rotation_degree, connections)
		"T-Kreuzung":
			connections[1] = true
			connections[0] = true
			_rotate_tile(_rotation_degree, connections)
		"Kreuzung":
			connections[1] = true
			connections[3] = true
			
func _rotate_tile(_rotation_degree : int, _connections : Array):
	for i in float(_rotation_degree) /90:
		for x in _connections:
			if(_connections[x] == true):
				_rotate_connection(x)
			
func _rotate_connection(connection : int):
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
