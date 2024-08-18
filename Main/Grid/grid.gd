extends Node2D

const WIDTH: int = 9
const HEIGHT: int = 9
const CELL_SIZE: int = 512

const CELL = preload("res://Main/Grid/Cell/cell.tscn")

var cells = []

@onready var tile_loader = TileLoader.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in HEIGHT:
		var row = []
		for j in WIDTH:
			# Create cell
			var cell: Cell = CELL.instantiate()
			
			# Set position
			cell.position = Vector2(i * CELL_SIZE, j * CELL_SIZE)
			
			# Connect signal
			cell.cell_clicked.connect(_on_cell_clicked)
			
			# Add cell to the scene
			$Cells.add_child(cell)
			row.append(cell)
			
		cells.append(row)
	
	spawn_start_tiles()

func spawn_start_tiles():
	cells[3][3].set_tile(tile_loader.load_tile(NewTile.Type.Post))
	
	cells[0][0].set_tile(tile_loader.load_tile(NewTile.Type.Haus))
	cells[5][1].set_tile(tile_loader.load_tile(NewTile.Type.Haus))
	cells[6][5].set_tile(tile_loader.load_tile(NewTile.Type.Haus))

func get_neighbors(cell: Cell):
	var neighbors = {}
	
	for i in cells.size():
		for j in cells[i].size():
			if cells[i][j] == cell:
				neighbors["Left"] = get_cell(i - 1, j)
				neighbors["Right"] = get_cell(i + 1, j)
				neighbors["Up"] = get_cell(i, j - 1)
				neighbors["Down"] = get_cell(i, j + 1)
	
	return neighbors

func get_cell(i: int, j: int) -> Cell:
	if i < 0 or i >= cells.size():
		return null
	
	if j < 0 or j >= cells[i].size():
		return null
	
	return cells[i][j]

func get_current_tile():
	return tile_loader.load_tile(NewTile.Type.Straße)

func place_tile(tile: NewTile, cell: Cell):
	if is_valid(tile, cell):
		cell.set_tile(tile)

# Check if a tile is allowed to be placed on a cell
func is_valid(tile: NewTile, cell: Cell):
	var neighbors = get_neighbors(cell)
	
	for neighbor in neighbors:
		match neighbor:
			"Up":
				if is_dir_valid(tile, neighbors, "Up"):
					return true
			"Down":
				if is_dir_valid(tile, neighbors, "Down"):
					return true
			"Left":
				if is_dir_valid(tile, neighbors, "Left"):
					return true
			"Right":
				if is_dir_valid(tile, neighbors, "Right"):
					return true
	
	# No connection to any neighbor
	return false

func is_dir_valid(tile, neighbors, dir: String):
	if neighbors[dir] == null:
		return false
	
	var tile_to_neighbor: Road.Direction
	var neighbor_to_tile: Road.Direction
	
	match dir:
		"Up":
			tile_to_neighbor = Road.Direction.North
			neighbor_to_tile = Road.Direction.South
		"Down":
			tile_to_neighbor = Road.Direction.South
			neighbor_to_tile = Road.Direction.North
		"Left":
			tile_to_neighbor = Road.Direction.West
			neighbor_to_tile = Road.Direction.East
		"Right":
			tile_to_neighbor = Road.Direction.East
			neighbor_to_tile = Road.Direction.West
	
	if not neighbors[dir].has_connection_in_dir(neighbor_to_tile):
		return false
	if not tile.has_connection_in_dir(tile_to_neighbor):
		return false
	
	return true

func _on_cell_clicked(cell: Cell):
	place_tile(get_current_tile(), cell)
