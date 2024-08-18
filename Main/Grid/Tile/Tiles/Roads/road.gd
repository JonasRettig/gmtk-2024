class_name Road extends "res://Main/Grid/Tile/tile.gd"

enum Direction {North, East, South, West}

@export var north_connected: bool
@export var east_connected: bool
@export var south_connected: bool
@export var west_connected: bool

func has_connection_to(dir: Direction):
	match dir:
		Direction.North:
			return north_connected
		Direction.East:
			return east_connected
		Direction.South:
			return south_connected
		Direction.West:
			return west_connected
