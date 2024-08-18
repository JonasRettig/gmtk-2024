extends GridContainer

var current_tile_selection : NewTile.Type

func get_current_tile():
	return current_tile_selection


func _on_texture_button_2_pressed() -> void:
	current_tile_selection = NewTile.Type.Straße


func _on_texture_button_1_pressed() -> void:
	current_tile_selection = NewTile.Type.Post


func _on_texture_button_3_pressed() -> void:
	current_tile_selection = NewTile.Type.Post


func _on_texture_button_4_pressed() -> void:
	current_tile_selection = NewTile.Type.Post
