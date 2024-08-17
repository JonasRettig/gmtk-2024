class_name Graph extends Resource

# Adjecencies of the graph
# All nodes and edges are stored in this dictionary
var adj = {}

#Add edges including adding nodes, Time O(1) Space O(1)
func add_edge(a, b, w):    
	# Add nodes if they don't already exist
	if a not in adj:
		adj[a] = []
	if b not in adj:
		adj[b] = []
	
	# Create edge from node a to node b
	var edge1 = GraphEdge.new(b, w)
	adj[a].append(edge1)
	
	# Create edge from node b to node a
	var edge2 = GraphEdge.new(a, w)
	adj[b].append(edge2)

#Find the edge between two nodes, Time O(n) Space O(1), n is number of neighbors 
func find_edge_by_nodes(a, b):
	if a not in adj or b not in adj:
		return null
	
	# Get all edges of node a
	var edges = adj.get(a)
	
	# Find the edge that connects a to b
	for edge in edges:
		if edge.neighbor == b:
			return edge
	
	# No edge found
	return null

#Remove direct connection between a and b, Time O(n) Space O(1)
func remove_edge(a, b):
	# Check if both bodes exist
	if a not in adj or b not in adj:
		return false
	
	# Get the edges of both nodes
	var edges_a = adj[a]
	var edges_b = adj[b] 
	
	# Check if both nodes have at least one edge
	if edges_a == null or edges_b == null:
		return false
	
	# Get the edge connecting a to b
	var edge1 = find_edge_by_nodes(a, b)
	
	if edge1 == null:
		return false
	
	# Remove the edge
	edges_a.erase(edge1)
	
	# Get the edge connecting b to a
	var edge2 = find_edge_by_nodes(b, a)
	
	if edge2 == null:
		return false
	
	# Remove the edge
	edges_b.erase(edge2)
	
	return true

#Remove a node including all its edges, 
#Time O(V+E) Space O(1)
func remove_node(a):
	# Check if the node even exists
	if a not in adj:
		return false   
		
	# Get the edges from the node
	var edges = adj[a]
	
	# Remove all edges
	for edge in edges:
		var edge1 = find_edge_by_nodes(edge.neighbor, a) 
		adj[edge.neighbor].erase(edge1)
	
	# Remove the node
	adj.erase(a)
	
	return true

#Check whether there is node by its key, Time O(1) Space O(1)
func has_node(node):
	return node in adj.keys()

#Check whether there is direct connection between two nodes, Time O(n), Space O(1)
func has_edge(a, b):
	var edge1 = find_edge_by_nodes(a, b)
	var edge2 = find_edge_by_nodes(b, a)
	
	return edge1 != null and edge2 != null
