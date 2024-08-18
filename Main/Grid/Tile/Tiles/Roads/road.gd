class_name Road extends "res://Main/Grid/Tile/tile.gd"

enum Direction {North, East, South, West}
enum RoadType {Straight, Cross, Curve, T_Cross}

@export var road_type: RoadType

@export var north_connected: bool
@export var east_connected: bool
@export var south_connected: bool
@export var west_connected: bool

var rotation: float

func has_connection_to(dir: Direction):
	var converted_dir = rotate_dir(dir)
	
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
	return int(dir + (rotation / 90.0)) % Direction.size()
