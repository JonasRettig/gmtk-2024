class_name CellInputManager extends Resource

signal cell_clicked
signal change_hover(hovering: bool)

var mouse_over = false

func _init(area2d: Area2D) -> void:
	area2d.connect("mouse_entered", _on_mouse_entered)
	area2d.connect("mouse_exited", _on_mouse_exited)
	area2d.connect("input_event", _on_input_event)

func _on_mouse_entered():
	mouse_over = true
	change_hover.emit(mouse_over)

func _on_mouse_exited():
	mouse_over = false
	change_hover.emit(mouse_over)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event.is_action_released("place_tile"):
		cell_clicked.emit()
