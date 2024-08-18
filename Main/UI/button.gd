extends TextureButton

var type : Road.RoadType:
	set(new_type):
		type = new_type
		match new_type:
			Road.RoadType.Straight:
				$TextureRect.texture = TileLoader.STRAIGHT.texture
			Road.RoadType.Cross:
				$TextureRect.texture = TileLoader.CROSS.texture
			Road.RoadType.Curve:
				$TextureRect.texture = TileLoader.CURVE.texture
			Road.RoadType.T_Cross:
				$TextureRect.texture = TileLoader.T_CROSS.texture

func get_type() -> Road.RoadType:
	return type
	
