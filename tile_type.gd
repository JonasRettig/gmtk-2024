extends Tile
class_name Tile_Type

@export
var type_name : Tile_Enum
@export
var rotation_degree : int

var car_n_w : bool = false
var car_n_s : bool = false
var car_n_e : bool = false
var car_w_e : bool = false
var car_w_s : bool = false
var car_s_e : bool = false

var train_n_w : bool = false
var train_n_s : bool = false
var train_n_e : bool = false
var train_w_e : bool = false
var train_w_s : bool = false
var train_s_e : bool = false

func _init(tile_name : Tile_Enum, rotation_degree : int):
	type_name = tile_name
	match tile_name:
		Tile_Enum.TEST:
			var connections = [
				train_n_e,
				train_n_w
			]
			for i in connections:
				connections[i] = true
			rotate_tile(rotation_degree, connections)
		Tile_Enum.TEST2:
			train_s_e = true
			
func _rotate_tile(rotation_degree : int, connections : Array):
	for i in rotation_degree/90:
		for x in connections:
			rotate_connection(connections[i])
			
func _rotate_connection(connection):
	match connection:
		car_n_w:
			car_n_w = false
			car_n_e = true
		car_n_s:
			car_n_s = false
			car_w_e = true
		car_n_e:
			car_n_e = false
			car_s_e = true
		car_w_e:
			car_w_e = false
			car_n_w = true
		car_w_s:
			car_w_s = false
			car_n_w = true
		car_s_e:
			car_s_e = false
			car_w_s = true
		train_n_w:
			train_n_w = false
			train_n_e = true
		train_n_s:
			train_n_s = false
			train_w_e = true
		train_n_e:
			train_n_e = false
			train_s_e = true
		train_w_e:
			train_w_e = false
			train_n_w = true
		train_w_s:
			train_w_s = false
			train_n_w = true
		train_s_e:
			train_s_e = false
			train_w_s = true
