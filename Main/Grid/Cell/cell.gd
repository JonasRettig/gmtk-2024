class_name Cell extends Node2D

signal cell_clicked(Cell)

enum State {Empty, Locked, Filled}

var state: State = State.Empty
var tile: NewTile

@onready
var input_manager = CellInputManager.new($Area2D)

func _ready() -> void:
	input_manager.connect("cell_clicked", _on_cell_clicked)
	input_manager.connect("change_hover", _on_hover_changed)

func _on_cell_clicked():
	if state == State.Empty:
		cell_clicked.emit(self)

func _on_hover_changed(hovering: bool):
	$Highlight.visible = hovering

func set_tile(new_tile: NewTile):
	tile = new_tile
	state = State.Filled
	$Foreground.texture = tile.texture
	
	if tile is Road:
		$Foreground.rotation_degrees = tile.rotation
func has_connection_in_dir(dir: Road.Direction):
	if state != State.Filled:
		return false
	
	return tile.has_connection_in_dir(dir)
