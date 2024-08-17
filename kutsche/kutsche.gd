extends Node2D

@export_range(0, 10, 0.1)
var speed = 5.0

var start: Tile
var target: Tile

var current: Tile
var next: Tile

var path: Array = []

var progress: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress = clamp(progress + delta * speed, 0, 1)
	
	if current == null:
		current = path.pop_front()
	
	if current == target:
		print("Reached target")
		return
	
	if next == null:
		next = path[0]
	
	position = lerp(current.position, next.position, progress)
	
	if progress == 1:
		current = path.pop_front()
		next = null
		progress = 0
