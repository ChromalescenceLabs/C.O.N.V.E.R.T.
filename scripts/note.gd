extends Area2D

@onready var note: Sprite2D = $Key
@onready var noteh: Sprite2D = $KeyH

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pickup"):
		GlobalVars.has_note = true
		get_parent().show_note()
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		noteh.show()
		note.hide()
		set_process_input(true)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		noteh.hide()
		note.show()
	set_process_input(false)
