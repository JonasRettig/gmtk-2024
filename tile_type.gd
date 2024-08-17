extends Tile
class_name Tile_Type

@export
var type_name : Tile_Enum

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

func _init(tile_name : Tile_Enum):
	type_name = tile_name
	match tile_name:
		Tile_Enum.TEST:
			train_n_w = true
		Tile_Enum.TEST2:
			train_s_e = true
			
