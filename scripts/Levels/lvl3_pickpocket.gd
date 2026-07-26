extends Node2D
@onready var pickpocket_label: Label = $"../../CanvasLayer/PickpocketLabel"
@onready var area_2d: Area2D = $NpcRoam/Area2D
signal office_access

const PICKPOCKET = preload("uid://dogkhu0vyw73e")

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pickpocket"):
		var pick = PICKPOCKET.instantiate()
		get_parent().get_parent().canvas_layer.add_child(pick)
		GlobalVars.is_interacting = true
		
		await pick.tree_exited
		
		office_access.emit()
		GlobalVars.is_interacting = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		pickpocket_label.show()
		set_process_input(true)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		pickpocket_label.hide()
		set_process_input(false)

func _on_office_access() -> void:
	area_2d.monitoring = false
