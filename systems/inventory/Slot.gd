extends Resource

class_name Slot

@export var points: Vector2
@export var occupied: bool
@export var item_id: int

func _init(_points: Vector2, _occupied: bool, _item_id: int):
	points = _points
	occupied = _occupied
	item_id = _item_id
