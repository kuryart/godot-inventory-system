@tool
extends EditorPlugin

var dock
var window: Window

func _enter_tree():
	dock = preload("res://addons/inventory_system_editor/InventorySystemEditor.tscn").instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BR, dock)

func _exit_tree():
	remove_control_from_docks(dock)
	dock.free()
