@tool
extends TextureRect

var grid_size = 79.0

@export_category("Item")
@export_group("Transform")

func _ready():
	get_parent().item_data.item_size_changed.connect(_on_item_size_changed)

func _input(event):
	if event is InputEventMouseMotion and InventoryAutoload.is_grabbing:
		position = event.position - (Vector2.ONE * grid_size)

func _on_item_grabbed(slot):
#	position = (slot - Vector2.ONE) * grid_size
	position = get_global_mouse_position() - (Vector2.ONE * grid_size)
	
#	var item_id = find_by_point(Vector2(5,7))
#	print(slot.item_id, " | ", slot.occupied, " | ", slot.points)
	
	print("item_grabbed", slot)
	
	pass # Replace with function body.
	
func _on_item_released(slot):
	position = (slot - Vector2.ONE) * grid_size
	print("item_released", slot)
	pass # Replace with function body.
	
func _on_item_size_changed(_size):
	size = Vector2i(grid_size * _size.x, grid_size * _size.y)

func _on_item_changed(item: Item):
#	print("item: ", item.file)
#	texture = load(item.file.load_path)
#	print("load path: ", item.file.load_path)
	texture = item.file
	size = Vector2i(grid_size * item.size.x, grid_size * item.size.y)
