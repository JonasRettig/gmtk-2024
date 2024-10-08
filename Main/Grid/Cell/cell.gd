class_name Cell extends Node2D

signal cell_clicked(Cell)

enum State {Empty, Locked, Filled}

var state: State = State.Empty
var tile: NewTile
var grid : Grid

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
	if state == State.Empty:
		$Highlight/HightliteTile.texture = get_tree().get_nodes_in_group("Buttons")[0].get_current_texture()
		$Highlight/HightliteTile.rotation_degrees = grid.current_rot

func _process(_delta: float) -> void:
	$Highlight/HightliteTile.rotation_degrees = grid.current_rot

func set_tile(new_tile: NewTile):
	tile = new_tile
	state = State.Filled
	$Foreground.texture = tile.texture
	get_tree().get_nodes_in_group("Buttons")[0].tile_placed_down()
	if tile is Road:
		$Foreground.rotation_degrees = tile.rotation
		
func has_connection_in_dir(dir: Road.Direction):
	if state != State.Filled:
		return false
	
	return tile.has_connection_in_dir(dir)
