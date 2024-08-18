extends GridContainer

var current_tile_selection : Road.RoadType = Road.RoadType.None
var last_pressed_button : int
var pressed_buttons : Array = []
var number_of_buttons : int = 4

func _ready():
	refill_buttons()

func get_current_tile():
	return current_tile_selection
	
func get_current_texture():
	match current_tile_selection:
		Road.RoadType.Straight:
			return TileLoader.STRAIGHT.texture
		Road.RoadType.Cross:
			return TileLoader.CROSS.texture
		Road.RoadType.Curve:
			return TileLoader.CURVE.texture
		Road.RoadType.T_Cross:
			return TileLoader.T_CROSS.texture
		Road.RoadType.None:
			return null

func tile_placed_down():
	current_tile_selection = Road.RoadType.None
	empty_button()
	
func empty_button():
	pressed_buttons.append(last_pressed_button)
	get_child(last_pressed_button).visible = false
		#empty button
	if(pressed_buttons.size() >= number_of_buttons):
		refill_buttons()
		
func refill_buttons():
	pressed_buttons = []
	for i in number_of_buttons:
		get_child(i).visible = true
		var button = get_child(i).get_child(0)
		button.type = get_random_road_type()

func get_random_road_type() -> Road.RoadType:
	return randi_range(1, Road.RoadType.size() - 1)

func _on_texture_button_1_pressed() -> void:
	current_tile_selection = get_child(0).get_child(0).get_type()
	last_pressed_button = 0
	

func _on_texture_button_2_pressed() -> void:
	current_tile_selection = get_child(1).get_child(0).get_type()
	last_pressed_button = 1


func _on_texture_button_3_pressed() -> void:
	current_tile_selection = get_child(2).get_child(0).get_type()
	last_pressed_button = 2


func _on_texture_button_4_pressed() -> void:
	current_tile_selection = get_child(3).get_child(0).get_type()
	last_pressed_button = 3
