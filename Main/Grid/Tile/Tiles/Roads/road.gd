class_name Road extends "res://Main/Grid/Tile/tile.gd"

enum Direction {North, East, South, West}

signal rotation_changed(float)

@export var north_connected: bool
@export var east_connected: bool
@export var south_connected: bool
@export var west_connected: bool

var rotation: float:
	set(new_rotation):
		rotation = new_rotation
		rotation_changed.emit(new_rotation)

func has_connection_to(dir: Direction):
	var converted_dir = int(rotation / 90.0)
	
	match converted_dir:
		Direction.North:
			return north_connected
		Direction.East:
			return east_connected
		Direction.South:
			return south_connected
		Direction.West:
			return west_connected
