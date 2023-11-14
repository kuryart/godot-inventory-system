@tool
extends TextureRect

var grid_size = 79

func _ready():
	get_parent().item_data.item_size_changed.connect(_on_item_size_changed)

func _on_item_grabbed(slot):
	var pivot = slot - Vector2.ONE	
	position = pivot * 79
	print("background_grabbed", slot)
	
func _on_item_released(slot):
	position = slot
	print("background_released", slot)

func _on_mouse_moved(slot):
	var pivot = slot - Vector2.ONE
	global_position = pivot * 79

func _on_item_size_changed(_size):
	size = Vector2i(grid_size * _size.x, grid_size * _size.y)

func _on_item_changed(item: Item):
	size = Vector2i(grid_size * item.size.x, grid_size * item.size.y)
