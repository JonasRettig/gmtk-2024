class_name NewTile extends Resource

enum Type {Post, Haus, Straße}

@export var type: Type
@export var texture: Texture2D

func has_connection_in_dir(dir: Road.Direction):
	match type:
		NewTile.Type.Post:
			return true
		NewTile.Type.Haus:
			return false # Häuser haben keine 'aktiven' connections
		NewTile.Type.Straße:
			var road = self as Road
			return road.has_connection_to(dir)
