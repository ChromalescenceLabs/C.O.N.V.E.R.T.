extends CharacterBody2D
class_name Player

const SPEED : int = 150
const ACCELERATION : int = 5
const FRICT : int = 8

func _physics_process(delta: float) -> void:
	if GlobalVars.is_interacting == false:
		get_player_input(delta)

func get_player_input(delta):
	var input = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"),
		Input.get_action_strength("Down") - Input.get_action_raw_strength("Up")
	).normalized()
	
	var lerp_weight = delta * (ACCELERATION if input else FRICT)
	velocity = lerp(velocity, input * SPEED, lerp_weight)
			
	move_and_slide()
