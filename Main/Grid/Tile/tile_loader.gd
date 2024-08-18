class_name TileLoader extends Resource

const POST = preload("res://Main/Grid/Tile/Tiles/Buildings/Post Office/post_office.tres")
const HOUSE = preload("res://Main/Grid/Tile/Tiles/Buildings/House/house.tres")
const STRAIGHT = preload("res://Main/Grid/Tile/Tiles/Roads/Straight/straight.tres")

func load_tile(type: NewTile.Type):	
	match type:
		NewTile.Type.Post:
			return POST.duplicate()
		NewTile.Type.Haus:
			return HOUSE.duplicate()
		NewTile.Type.Straße:
			return STRAIGHT.duplicate()
