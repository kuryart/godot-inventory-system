@tool
extends Control

class_name ItemNode

signal item_changed
var grid_size = 79.0

@export var pivot_slot: Vector2i:
	set(value):
		pivot_slot = value
		position = Vector2(grid_size * pivot_slot)

@export_category("Item")
@export_group("Transform")
@export var item_data: Item:
	set(value):
		item_data = value
		size = Vector2i(grid_size * item_data.size.x, grid_size * item_data.size.y)
		item_changed.emit(item_data)

func _ready():
	item_data.item_size_changed.connect(_on_item_size_changed)

#func _input(event):
#	if event is InputEventMouseMotion and InventoryAutoload.is_grabbing:
#		position = event.position - (Vector2.ONE * grid_size)

func _on_item_grabbed(slot):
#	position = (slot - Vector2.ONE) * grid_size
	position = get_global_mouse_position() - (Vector2.ONE * grid_size)
	
#	var item_id = find_by_point(Vector2(5,7))
#	print(slot.item_id, " | ", slot.occupied, " | ", slot.points)
	
	print("item_grabbed", slot)
	
func _on_item_released(slot):
	position = (slot - Vector2.ONE) * grid_size
	print("item_released", slot)

func _on_item_size_changed(_size):
	size = Vector2i(grid_size * _size.x, grid_size * _size.y)


#func _on_mouse_entered():
#	print(self)
#	pass # Replace with function body.


func _on_gui_input(event):
	print("event: ", event)
	if event is InputEventMouseMotion and InventoryAutoload.is_grabbing:
		position = event.position - (Vector2.ONE * grid_size)
		print("position: ", position)
