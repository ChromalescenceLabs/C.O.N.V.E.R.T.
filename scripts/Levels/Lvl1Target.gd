extends Node2D

const MISSION_END = preload("uid://brtmt3juhpp44")
@onready var kill_label: Label = $"../../CanvasLayer/KillLabel"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		var end = MISSION_END.instantiate()
		end.status = "Success"
		end.next_scene = "uid://cqjc8fkilwk2g"
		get_parent().add_child(end)
		
func _on_kill_area_body_entered(body: Node2D) -> void:
	if body is Player:
		kill_label.show()
		set_process_input(true)

func _on_kill_area_body_exited(body: Node2D) -> void:
	if body is Player:
		kill_label.hide()
		set_process_input(false)
