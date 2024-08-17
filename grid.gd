extends Node2D

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
