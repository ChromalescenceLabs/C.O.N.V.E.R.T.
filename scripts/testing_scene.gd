extends Node2D
@onready var npc: CharacterBody2D = $NPC
@onready var player_cam: Camera2D = $Player/PlayerCam
@onready var overall_cam: Camera2D = $OverallCam

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		var STATE = npc.STATE
		npc.current_state = STATE.DISTRACTED
		npc.stay = true
	if event.is_action_pressed("Space"):
		camToggle()

# Use this function when implementing camera
func camToggle():
	if player_cam.enabled:
		player_cam.enabled = false
		overall_cam.enabled = true
	else:
		player_cam.enabled = true
		overall_cam.enabled = false
		
