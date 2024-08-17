extends Grid
class_name Tile

@export 
var x_location : int
@export 
var y_location : int
@export 
var is_filled : bool
@export 
var is_placing_allowed : bool
@export
var placedTile : Tile_Type

func _init(_x_location, _y_location):
	x_location = _x_location
	y_location = _y_location
	is_filled = false 

func _fill_tile(tile_enum : String, rotation_degree : int):
	placedTile = Tile_Type.new(tile_enum, rotation_degree)
	if(_is_tile_placeable(placedTile)):
		is_filled = true

func _is_tile_placeable(placedTile : Tile_Type) -> bool:
	var neighbours : Array = _return_neighbours(placedTile)

	#Connection nach Norden
	if(neighbours[0] != null):
		var this_connection = _get_connection_type(placedTile, Direction_Enum.North);
		var neighbour_connection = _get_connection_type(neighbours[0], Direction_Enum.South);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	if(neighbours[1] != null):
		var this_connection = _get_connection_type(placedTile, Direction_Enum.East);
		var neighbour_connection = _get_connection_type(neighbours[0], Direction_Enum.West);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	if(neighbours[2] != null):
		var this_connection = _get_connection_type(placedTile, Direction_Enum.South);
		var neighbour_connection = _get_connection_type(neighbours[0], Direction_Enum.North);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	if(neighbours[3] != null):
		var this_connection = _get_connection_type(placedTile, Direction_Enum.West);
		var neighbour_connection = _get_connection_type(neighbours[0], Direction_Enum.East);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	return false
			
func _get_connection_type(input_tile : Tile_Type, direction):
		match direction:
			Direction_Enum.North:
				if(input_tile.car_n_e 
				or input_tile.car_n_s
				or input_tile.car_n_w):
					return Transport_Enum.Car
				elif(input_tile.train_n_e 
				or input_tile.train_n_s
				or input_tile.train_n_w):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None
			Direction_Enum.West:
				if(input_tile.car_w_e 
				or input_tile.car_w_s
				or input_tile.car_n_w):
					return Transport_Enum.Car
				elif(input_tile.train_w_e 
				or input_tile.train_w_s
				or input_tile.train_n_w):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None
			Direction_Enum.South:
				if(input_tile.car_s_e 
				or input_tile.car_w_s
				or input_tile.car_n_s):
					return Transport_Enum.Car
				elif(input_tile.train_s_e 
				or input_tile.train_w_s
				or input_tile.train_n_s):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None
			Direction_Enum.East:
				if(input_tile.car_s_e 
				or input_tile.car_w_e
				or input_tile.car_n_e):
					return Transport_Enum.Car
				elif(input_tile.train_s_e 
				or input_tile.train_w_e
				or input_tile.train_n_e):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None
