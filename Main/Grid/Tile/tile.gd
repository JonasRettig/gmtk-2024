class_name NewTile extends Resource

enum Type {Post, Haus, Straße, None}

@export var type: Type
@export var texture: Texture2D

func has_connection_in_dir(dir: Road.Direction):
	match type:
		Type.Post:
			return true
		Type.Haus:
			return true # Häuser haben keine 'aktiven' connections
		Type.Straße:
			var road = self as Road
			return road.has_connection_to(dir)
		Type.None:
			return false

func _to_string() -> String:
	# Type.Straße muss nicht geprüft werden, weil Straßen _to_string() selber implementieren
	match type:
		Type.Post:
			return "Post"
		Type.Haus:
			return "Haus"
		_:
			return "None"
