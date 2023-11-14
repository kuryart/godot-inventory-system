@tool
extends Resource

class_name Item

signal item_size_changed

#@export var base_path = "res://"
@export var name: String
@export_multiline var description: String
@export var size: Vector2i:
	set(value):
		if value.x < 1: value.x = 1
		if value.y < 1: value.y = 1
		if value.x > 3: value.x = 3
		if value.y > 3: value.y = 3
		size = value
		item_size_changed.emit(size)

@export var file: CompressedTexture2D
