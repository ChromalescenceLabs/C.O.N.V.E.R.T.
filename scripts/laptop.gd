extends Area2D
const HACKING = preload("uid://mjqvux53fn2c")
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var color_rect: ColorRect = $ColorRect

@export var opened : bool = false

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Hacking"):
		var Hack = HACKING.instantiate()
		get_parent().canvas_layer.add_child(Hack)
		GlobalVars.is_interacting = true
		set_process_input(false)
		
		await Hack.tree_exited
		
		get_parent().systems_accessed = true
		GlobalVars.is_interacting = false
		monitoring = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		set_process_input(true)


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		set_process_input(false)
