class_name Graph extends Resource

# Biggest value an int can store
const MAX_INT: int = 9223372036854775807

# Adjecencies of the graph
# All nodes and edges are stored in this dictionary
var adj = {}
var nodes = []

#Add edges including adding nodes, Time O(1) Space O(1)
func add_edge(a, b, w = 1 ):    
	# Add nodes if they don't already exist
	add_node(a)
	add_node(b)
	
	# Create edge from node a to node b
	var edge1 = GraphEdge.new(b, w)
	adj[a].append(edge1)
	
	# Create edge from node b to node a
	var edge2 = GraphEdge.new(a, w)
	adj[b].append(edge2)

func add_node(node):
	if node not in adj:
		adj[node] = []
		nodes.append(node)

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
	nodes.erase(a)
	
	return true

#Check whether there is node by its key, Time O(1) Space O(1)
func has_node(node):
	return node in nodes

#Check whether there is direct connection between two nodes, Time O(n), Space O(1)
func has_edge(a, b):
	var edge1 = find_edge_by_nodes(a, b)
	var edge2 = find_edge_by_nodes(b, a)
	
	return edge1 != null and edge2 != null

#Check there is path from src and dest
#BFS, Time O(V+E), Space O(V)
func bfs_has_path(src, dest):
	# Check if both nodes exist
	if src not in adj or dest not in adj:
		return false
	
	# Create list of visited nodes and a queue of nodes to visit
	var visited = {} 
	var queue = [] 
	
	# Mark the first node as visited and add it to the queue
	visited[src] = true
	queue.append(src) 
	
	# Look at the next node in the queue until all nodes were checked
	while queue: 
		var v = queue.pop_at(0)
		
		# Check if the destination is reached
		if v == dest: 
			return true 
		
		# Add all edges of the current node to the queue
		for edge in adj[v]:  
			var u = edge.neighbor              
			if u not in visited:  
				queue.append(u)
				visited[u] = true
	
	# All nodes were visited. No path exists
	return false 

## Check there is path from src and dest
## DFS, Time O(V+E), Space O(V)
#func dfs_has_path(src, dest): 
	## Check if both nodes exist
	#if src not in adj or dest not in adj:
		#return false
	#
	#var visited = {}
	#return dfs_helper(src, dest, visited)
#
##DFS helper, Time O(V+E), Space O(V) 
#func dfs_helper(v, dest, visited):
	## Check if we've reached our destination
	#if v == dest:
		#return true
	#
	## Mark the current node as visited
	#visited[v] = true
	#
	## Check every unvisited neighbor recursively
	#for edge in adj[v]:
		#var u = edge.neighbor
		#if u not in visited:
			#return dfs_helper(u, dest, visited)
	#
	#return false

# Traversal starting from src, BFS, Time O(V+E), Space O(V)
func bfs_traversal(src): 
	# Check if the starting node exists
	if src not in adj:
		return
	
	# Prepare queue of nodes to visit and list of visited nodes
	var queue = [] 
	var visited = {} 
	
	# Start by considering the first node
	queue.append(src) 
	visited[src] = true 
	
	# Keep looking at the first element in the queue
	while queue: 
		var v = queue.pop_at(0) 
		
		# Run code for node
		print(str(v))
		
		# Add all connected nodes to the queue
		for edge in adj[v]:   
			var u = edge.neighbor
			if u not in visited:
				queue.append(u) 
				visited[u] = true

func dijkstra(src):
	var dist = {}
	var queue = []
	var prev = {}
	
	for node in nodes:
		dist[node] = MAX_INT
		queue.append(node)
	
	dist[src] = 0
	
	while queue:
		var min_dist = MAX_INT
		var u
		
		for element in queue:
			if dist[element] < min_dist:
				min_dist = dist[element]
				u = element
		
		queue.erase(u)
		
		for edge in adj[u]:
			var neighbor = edge.neighbor
			
			if neighbor in queue:
				var alt = dist[u] + edge.weight
				
				if alt < dist[neighbor]:
					dist[neighbor] = alt
					prev[neighbor] = u
	
	return [dist, prev]
	
