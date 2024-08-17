extends Control
class_name UI

const tiles_to_show : int = 4
const button_size : int = 128

var buttonScene = preload("res://streetbutton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in tiles_to_show:
		create_new_child(i)
		
func create_new_child(i : int):
	var instance: StreetButton = buttonScene.instantiate()
	instance.button_holder = self
	instance.position = Vector2(i*button_size + 64, 600)
	instance.index = i
	add_child(instance)
		
func make_current_selection(tile : String):
	get_parent().select_tile(tile)
	
func kill_child(child):
	child.queue_free()
	create_new_child(child.index)
