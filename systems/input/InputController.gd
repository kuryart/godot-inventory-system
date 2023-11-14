extends Node

const GameStates = GameController.GameStates
const INVENTORY: GameStates = GameStates.INVENTORY

signal mouse_left_click
signal mouse_move
signal inventory_opened
signal inventory_closed

func _input(event):
	# Inventory
	if Input.is_action_just_pressed("inventory"):
		print("inventory")
		if is_game_state(INVENTORY): 
			inventory_closed.emit()
		else:
			inventory_opened.emit()
	
#	# Mouse Move
#	if is_game_state(INVENTORY) and event is InputEventMouseMotion:
#		print("mouse_move")
#		mouse_move.emit(event.position)

#	# Mouse Left Click
#	if Input.is_action_just_pressed("mouse_left_click"):
#		print("mouse_left_click")
#		mouse_left_click.emit(event.position)

func is_game_state(state: GameStates) -> bool:
	return GameController.is_game_state(INVENTORY)
