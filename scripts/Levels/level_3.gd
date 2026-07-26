extends Node2D
@onready var player_cam: Camera2D = $Player/Camera2D
@onready var overall_cam: Camera2D = $Camera2D
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var restricted_access: StaticBody2D = $RestrictedAccess
@onready var pickpocket: CharacterBody2D = $NPCS/NPC3/NpcRoam
@onready var guard: CharacterBody2D = $NPCS/Guard/NpcRoam
@onready var pick_indic: Label = $NPCS/NPC3/NpcRoam/PickIndic
@onready var guard_indic: Label = $NPCS/Guard/NpcRoam/GuardIndic

func _ready() -> void:
	GlobalVars.has_key = false

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

func _on_npc_3_office_access() -> void:
	restricted_access.process_mode = Node.PROCESS_MODE_DISABLED
	restricted_access.hide()
	var PSTATE = pickpocket.STATE
	var GSTATE = guard.STATE
	pickpocket.current_state = PSTATE.DISTRACTED
	guard.current_state = GSTATE.DISTRACTED
	pickpocket.stay = true
	guard.stay = true
	pick_indic.show()
	guard_indic.show()
