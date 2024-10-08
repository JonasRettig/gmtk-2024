extends Node2D
class_name Grid

const WIDTH: int = 30
const HEIGHT: int = 40
const CELL_SIZE: int = 512

const CELL = preload("res://Main/Grid/Cell/cell.tscn")

var cells = []
var current_rot: float

@onready var tile_loader = TileLoader.new()
@onready var graph = Graph.new()

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
			
			cell.grid = self
			
			# Add cell to the scene
			$Cells.add_child(cell)
			row.append(cell)
			
		cells.append(row)
	
	spawn_start_tiles()

func spawn_start_tiles():
	cells[10][6].set_tile(tile_loader.load_tile(NewTile.Type.Post))
	
	var amount = int((WIDTH * HEIGHT) * 0.05)
	
	for i in amount:
		var col = randi_range(1, HEIGHT - 1)
		var row = randi_range(1, WIDTH - 1)
		
		if not ((col == 9 or col == 10 or col == 11)
		and (row == 5 or row == 6 or row == 7)):
			cells[col][row].set_tile(tile_loader.load_tile(NewTile.Type.Haus))
		
	

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

func get_current_road():
	return tile_loader.load_tile(
		NewTile.Type.Straße,
		get_tree().get_nodes_in_group("Buttons")[0].get_current_tile()
	)

func place_tile(tile: NewTile, cell: Cell):
	if tile is Road:
		(tile as Road).rotation = current_rot
	
	if is_valid(tile, cell):
		cell.set_tile(tile)
		update_graph(tile, cell)

func update_graph(tile: NewTile, cell: Cell):
	var neighbors = get_neighbors(cell)
	
	for neighbor in neighbors:
		if is_dir_valid(tile, neighbors, neighbor):
			graph.add_edge(tile, neighbors[neighbor].tile)

# Check if a tile is allowed to be placed on a cell
func is_valid(tile: NewTile, cell: Cell):
	var neighbors = get_neighbors(cell)
	
	for neighbor in neighbors:
		if is_dir_valid(tile, neighbors, neighbor):
			return true
	
	# No connection to any neighbor
	return false

func is_dir_valid(tile, neighbors, dir: String):
	if neighbors[dir] == null:
		return false
	
	if tile == null:
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

func _process(_delta: float):
	if Input.is_action_just_released("Rotate Tile Right"):
		rotate_right()

func rotate_right():
	current_rot = int(current_rot + 90) % 360

func _on_cell_clicked(cell: Cell):
	place_tile(get_current_road(), cell)
