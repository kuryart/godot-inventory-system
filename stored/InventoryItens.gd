@tool
extends Resource

class_name InventoryItens

@export var itens = [
	{
		"item": preload("res://database/itens/helmet.tres"),
		"slot": Vector2i(0,0)
	},
	{
		"item": preload("res://database/itens/sword.tres"),
		"slot": Vector2i(3,1)
	},	
]
