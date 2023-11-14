@tool

extends Control

signal mouse_moved
signal grabbed
signal released

var grabbed_item_position
var grabbed_item_slot

@export var stored_itens: InventoryItens

@export var grid_size = Vector2 (8,8)
@export var slots: Array:
	set(value):
		slots = value
@export var items: Array[Item]:
	set(value):
		items = value

var last_slot

# Called when the node enters the scene tree for the first time.
func _ready():
	build_grid()
#	build_grid_new()

func _on_inventory_closed():
	print("closed")
	
	if InventoryAutoload.is_grabbing:
		release(grabbed_item_position)
	
	GameController.set_game_state(GameController.GameStates.WORLD)
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()

func _on_inventory_opened():
	print("opened")
	GameController.set_game_state(GameController.GameStates.INVENTORY)
	process_mode = Node.PROCESS_MODE_INHERIT
	show()

func _on_mouse_left_click(mouse_position: Vector2):
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return
	
	if InventoryAutoload.is_grabbing: release(mouse_position)
	else: grab(mouse_position)

func _on_mouse_move(mouse_position: Vector2):
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return	
	
	var slot = (mouse_position / 79).ceil()
	if last_slot != slot and InventoryAutoload.is_grabbing:
		last_slot = slot
		mouse_moved.emit(slot)
		print(slot)
	
func build_grid():
	slots = []
	
	var x = grid_size.x
	var y = grid_size.y
	
	var slots_y = []
	slots_y.resize(y)
	
	var slots_x = []
	slots_x.resize(x)
	
	var slot: Slot
	
	for line in range(x):
		slots_y = []
		slots_y.resize(y)
		for column in range(y):
			slot = Slot.new(Vector2i(line,column), false, -1)
			slots_y[column] = slot
		slots_x[line] = slots_y
	
	slots = slots_x
	
	for linha in range(slots.size()):
		for coluna in range(slots[0].size()):
			slot = slots[linha][coluna]
			print("%s: ID: %s | Occupied: %s" % [slot.points, slot.item_id, slot.occupied])

#func find_by_point(point: Vector2):
##	var slots_sliced = slots.slice()
#
#	for slot in slots:
#		if point == slot.points:
#			return slot

func grab(mouse_position: Vector2):
	grabbed_item_position = mouse_position
	var slot = (mouse_position / 79).ceil()
	grabbed_item_slot = slot
	InventoryAutoload.is_grabbing = true
	grabbed.emit(slot)
	
func release(mouse_position: Vector2):
	var slot = (mouse_position / 79).ceil()
	# Check if slot is available
	
	InventoryAutoload.is_grabbing = false
	released.emit(slot)
