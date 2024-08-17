extends TextureButton
class_name StreetButton

var tile : String = "Hub"
var button_holder : Control
var index : int

const kinds_of_tiles : Array = [
	"Hub",
	"Gerade",
	"Kurve",
	"T-Kreuzung",
	"Kreuzung"
]


const colors : Array = [
	Color.AQUA,
	Color.REBECCA_PURPLE,
	Color.CORNFLOWER_BLUE,
	Color.DARK_RED,
	Color.GREEN
]

func _ready() -> void:
	var rand_int : int = randi_range(0,4)
	tile = kinds_of_tiles[rand_int]
	tooltip_text = tile
	modulate = colors[rand_int]

func _on_button_up() -> void:
	button_holder.make_current_selection(tile)
	button_holder.kill_child(self)
