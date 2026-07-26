extends StaticBody2D
const LOCKPICK = preload("uid://coxh8yixjx6jf")
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var color_rect: ColorRect = $ColorRect
@onready var door_interact: CollisionShape2D = $DoorInteract/CollisionShape2D

@export var opened : bool = false

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Lockpick"):
		var lpick_scene = LOCKPICK.instantiate()
		get_parent().get_parent().canvas_layer.add_child(lpick_scene)
		GlobalVars.is_interacting = true
		
		await lpick_scene.tree_exited
		
		opened = true
	elif event.is_action_pressed("Open"):
		if GlobalVars.has_key:
			opened = true
		else:
			pass
			#add locked sound here
		
func _process(_delta: float) -> void:
	if opened:
		collision_shape_2d.disabled = true
		color_rect.modulate.a = 0.5
		door_interact.disabled = true


func _on_door_interact_body_entered(body: Node2D) -> void:
	if body is Player:
		set_process_input(true)


func _on_door_interact_body_exited(body: Node2D) -> void:
	if body is Player:
		set_process_input(false)
