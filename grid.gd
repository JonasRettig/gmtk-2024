extends Node2D
class_name Grid

const x_scale : int = 10
const y_scale : int = 10
var tile_size : int = 512 
var tile_array : Array 

var tileScene = preload("res://tile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for y in y_scale:
		var row : Array
		for x in x_scale:
			var instance: Tile = tileScene.instantiate()
			instance.grid = self
			instance.x_location = x
			instance.y_location = y
			instance.position = Vector2(x*tile_size,y*tile_size)
			add_child(instance)
			row.append(instance)
		tile_array.append(row)

	
func _return_neighbours(tile : Tile):
	var return_array : Array = [null, null, null, null]
	#Über
	if(tile.y_location != 0):
		return_array[0] = (tile_array[tile.y_location-1][tile.x_location].placedTile)
	#Rechts
	if(tile.x_location != x_scale-1):
		return_array[1] = (tile_array[tile.y_location][tile.x_location + 1].placedTile)
	#Unten
	if(tile.y_location != y_scale - 1):
		return_array[2] = (tile_array[tile.y_location+1][tile.x_location].placedTile)
	#Links
	if(tile.x_location != 0):
		return_array[3] = (tile_array[tile.y_location][tile.x_location-1].placedTile)
	return return_array
