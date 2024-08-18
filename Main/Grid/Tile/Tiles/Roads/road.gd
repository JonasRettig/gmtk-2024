class_name Road extends "res://Main/Grid/Tile/tile.gd"

enum Direction {North, East, South, West}
enum RoadType {None, Straight, Cross, Curve, T_Cross}

@export var road_type: RoadType

@export var north_connected: bool
@export var east_connected: bool
@export var south_connected: bool
@export var west_connected: bool

var rotation: float

func has_connection_to(dir: Direction):
	var converted_dir = rotate_dir(dir)
	
	print(converted_dir)
	
	match converted_dir:
		Direction.North:
			return north_connected
		Direction.East:
			return east_connected
		Direction.South:
			return south_connected
		Direction.West:
			return west_connected

func rotate_dir(dir: Direction):
	var return_dir : int
	var modifier : int = int(rotation/90)
	if(dir - modifier < 0):
		return_dir = 4 + (dir - modifier)
	else:
		return_dir = dir - modifier
	return return_dir

func _to_string() -> String:
	match road_type:
		RoadType.Straight:
			return "Straight"
		RoadType.Cross:
			return "Cross"
		RoadType.Curve:
			return "Curve"
		RoadType.T_Cross:
			return "T_Cross"
		_:
			return "None"
