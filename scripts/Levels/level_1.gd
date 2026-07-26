extends Node2D
@onready var player_cam: Camera2D = $Player/Camera2D
@onready var overall_cam: Camera2D = $Camera2D
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Space") and not GlobalVars.is_interacting:
		camToggle()

func camToggle():
	if player_cam.enabled:
		player_cam.enabled = false
		overall_cam.enabled = true
	else:
		player_cam.enabled = true
		overall_cam.enabled = false
