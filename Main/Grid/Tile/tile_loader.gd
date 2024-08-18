class_name TileLoader extends Resource

const POST = preload("res://Main/Grid/Tile/Tiles/Buildings/Post Office/post_office.tres")
const HOUSE = preload("res://Main/Grid/Tile/Tiles/Buildings/House/house.tres")
const STRAIGHT = preload("res://Main/Grid/Tile/Tiles/Roads/Straight/straight.tres")
const CROSS = preload("res://Main/Grid/Tile/Tiles/Roads/Cross/cross.tres")
const CURVE = preload("res://Main/Grid/Tile/Tiles/Roads/Curve/curve.tres")
const T_CROSS = preload("res://Main/Grid/Tile/Tiles/Roads/T_Cross/t_cross.tres")

func load_tile(tile_type: NewTile.Type,
	road_type: Road.RoadType = Road.RoadType.Straight):
		
	match tile_type:
		NewTile.Type.Post:
			return POST.duplicate()
		NewTile.Type.Haus:
			return HOUSE.duplicate()
		NewTile.Type.Straße:
			match road_type:
				Road.RoadType.Straight:
					return STRAIGHT.duplicate()
				Road.RoadType.Cross:
					return CROSS.duplicate()
				Road.RoadType.Curve:
					return CURVE.duplicate()
				Road.RoadType.T_Cross:
					return T_CROSS.duplicate()
