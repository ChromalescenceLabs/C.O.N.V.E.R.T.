extends Area2D
@onready var key: Sprite2D = $Key
@onready var keyh: Sprite2D = $KeyH

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pickup"):
		GlobalVars.has_key = true
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		keyh.show()
		key.hide()
		set_process_input(true)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		keyh.hide()
		key.show()
	set_process_input(false)
