extends Control

const game_scene = preload("res://Main/Main.tscn")

func _on_button_pressed() -> void:
	var instance = game_scene.instantiate()
	get_tree().root.add_child(instance)
	queue_free()


func _on_button_2_pressed() -> void:
	$Credits.visible = !$Credits.visible
	$Controls.visible = !$Controls.visible
	if($TextureRect/Button2.text == "Controls"):
		$TextureRect/Button2.text = "Credits"
	else:
		$TextureRect/Button2.text = "Controls"


func _on_button_3_pressed() -> void:
	get_tree().quit()
