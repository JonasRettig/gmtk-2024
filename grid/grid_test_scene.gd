extends Node2D

var graph : Graph = Graph.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Add two nodes (0 and 1) to the graph with a weight of 1
	graph.add_edge("Poststation", "1", 1)
	
	# Passiert "gleichzeitig", weil Haus schon exestiert
	graph.add_edge("1", "2", 1)
	graph.add_edge("2", "Haus 1", 1)
	
	graph.add_edge("2", "3", 1)
	
	graph.add_edge("3", "4", 1)
	graph.add_edge("4", "Haus 2", 1)
	
	graph.add_edge("2", "5", 1)
	graph.add_edge("5", "Poststation", 1)
	
	graph.remove_node("5")
	
	print(graph.has_edge("Poststation", "5"))
