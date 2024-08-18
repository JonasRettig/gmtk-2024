extends Node2D

const TILE = preload("res://tile.tscn")

@onready var kutsche = $Kutsche

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start = TILE.instantiate()
	
	add_child(start)
	kutsche.start = start
	kutsche.path.append(start)
	
	for i in 3:
		var road = TILE.instantiate()
		
		road.position = Vector2(512 * (i + 1), 0)
		
		add_child(road)
		kutsche.path.append(road)
	
	var target = TILE.instantiate()
	
	target.position = Vector2(512 * 4, 0)
	
	add_child(target)
	kutsche.path.append(target)
	kutsche.target = target


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
