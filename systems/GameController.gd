extends Node

enum GameStates { PAUSED, WORLD, INVENTORY }
@export var game_state: GameStates = GameStates.INVENTORY

func is_game_state(_game_state: GameStates) -> bool:
	return game_state == _game_state
	
func set_game_state(_game_state: GameStates):
	game_state = _game_state
	return game_state
