extends Node2D

var current_tile_selection : String = ""

@onready
var graph: Graph = Graph.new()

func _ready() -> void:
	$Grid.graph = graph

func select_tile(tile : String):
	current_tile_selection = tile
