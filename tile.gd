extends Node2D
class_name Tile

@export 
var x_location : int
@export 
var y_location : int
@export 
var is_filled : bool
@export
var type : Tile_Type



func _init(_x_location:=0, _y_location:=0):
	x_location = _x_location
	y_location = _y_location
	is_filled = false
	type = Tile_Type.new(null)


func _fill_tile(tile_type : ):
	is_filled = true
	type = Tile_Type.new(tile_type)
