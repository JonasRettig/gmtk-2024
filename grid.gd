extends Node2D
class_name Grid

const x_scale : int = 200
const y_scale : int = 400
var tile_array : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for y in y_scale:
		for x in x_scale:
			tile_array.append(Tile.new(x,y))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tile_array[1][1]
	pass
	
func _return_neighbours(tile : Tile):
	var return_arry : Array
	#Über
	if(tile.y_location != 0):
		return_arry.append(tile_array[tile.y_location-1][tile.x_location])
	else : 
		return_arry.append(null)
	#Rechts
	if(tile.x_location != x_scale-1):
		return_arry.append(tile_array[tile.y_location][tile.x_location + 1])
	else : 
		return_arry.append(null)
	#Unten
	if(tile.y_location != y_scale - 1):
		return_arry.append(tile_array[tile.y_location+1][tile.x_location])
	else : 
		return_arry.append(null)
	#Links
	if(tile.x_location != 0):
		return_arry.append(tile_array[tile.y_location][tile.x_location-1])
	else : 
		return_arry.append(null)
