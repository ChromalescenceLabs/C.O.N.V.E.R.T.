extends Node2D

@onready var player_cam: Camera2D = $Player/Camera2D
@onready var overall_cam: Camera2D = $Camera2D
@onready var canvas_layer: CanvasLayer = $CanvasLayer
var systems_accessed = false
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var confrotn: RichTextLabel = $CanvasLayer/confrotn

var confront : bool = false

func _process(_delta: float) -> void:
	if systems_accessed:
		static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED
		static_body_2d.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Space") and not GlobalVars.is_interacting:
		camToggle()
	if confront:
		if event.is_action_pressed("Kill"):
			SceneLoader.load_scene("uid://hkowteb4uvpv", 2)

func camToggle():
	if player_cam.enabled:
		player_cam.enabled = false
		overall_cam.enabled = true
	else:
		player_cam.enabled = true
		overall_cam.enabled = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		confrotn.show()
		confront = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		confrotn.hide()
		confront = false
