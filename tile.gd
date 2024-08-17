extends Node2D
class_name Tile

var grid: Grid

@export 
var x_location : int
@export 
var y_location : int
@export
var placedTile : Tile_Type

var is_filled : bool = false
var is_placing_allowed : bool

func _ready() -> void:
	if (x_location == 0 and y_location == 0):
		$Sprite2D.visible = true
		placedTile=Tile_Type.new("Start",0)
		is_filled = true

func _fill_tile(tile_enum : String, rotation_degree : int):
	placedTile = Tile_Type.new(tile_enum, rotation_degree)
	if(_is_tile_placeable(placedTile)):
		$Sprite2D.visible = true
		is_filled = true
	else:
		placedTile = null

func _is_tile_placeable(_placedTile : Tile_Type) -> bool:
	
	if(is_filled):
		return false
	
	var neighbours : Array = grid._return_neighbours(self)

	#Connection nach Oben
	if(neighbours[0] != null):
		var this_connection = _get_connection_type(_placedTile, Direction_Enum.North);
		var neighbour_connection = _get_connection_type(neighbours[0], Direction_Enum.South);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	#Connections nach Rechts
	if(neighbours[1] != null):
		var this_connection = _get_connection_type(_placedTile, Direction_Enum.East);
		var neighbour_connection = _get_connection_type(neighbours[1], Direction_Enum.West);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	#Connections nach Süden
	if(neighbours[2] != null):
		var this_connection = _get_connection_type(_placedTile, Direction_Enum.South);
		var neighbour_connection = _get_connection_type(neighbours[2], Direction_Enum.North);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	#Connections nach links
	if(neighbours[3] != null):
		var this_connection = _get_connection_type(_placedTile, Direction_Enum.West);
		var neighbour_connection = _get_connection_type(neighbours[3], Direction_Enum.East);
		if(this_connection != Transport_Enum.None and this_connection == neighbour_connection):
			return true
	return false
			
func _get_connection_type(input_tile : Tile_Type, direction):
		match direction:
			Direction_Enum.North:
				if(input_tile.connections[2]
				or input_tile.connections[1]
				or input_tile.connections[0]):
					return Transport_Enum.Car
				elif(input_tile.connections[8] 
				or input_tile.connections[7]
				or input_tile.connections[6]):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None
			Direction_Enum.West:
				if(input_tile.connections[3]
				or input_tile.connections[4]
				or input_tile.connections[0]):
					return Transport_Enum.Car
				elif(input_tile.connections[9] 
				or input_tile.connections[10]
				or input_tile.connections[6]):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None
			Direction_Enum.South:
				if(input_tile.connections[5] 
				or input_tile.connections[4]
				or input_tile.connections[1]):
					return Transport_Enum.Car
				elif(input_tile.connections[11] 
				or input_tile.connections[10]
				or input_tile.connections[7]):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None
			Direction_Enum.East:
				if(input_tile.connections[5] 
				or input_tile.connections[3]
				or input_tile.connections[2]):
					return Transport_Enum.Car
				elif(input_tile.connections[11] 
				or input_tile.connections[9]
				or input_tile.connections[8]):
					return Transport_Enum.Train
				else:
					return Transport_Enum.None


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if(event is InputEventMouseButton):
		if (event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
			_fill_tile("Start", 0)
