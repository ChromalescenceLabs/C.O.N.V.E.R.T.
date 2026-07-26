extends Node2D
@onready var player_cam: Camera2D = $Player/Camera2D
@onready var overall_cam: Camera2D = $Camera2D
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var restricted_access: StaticBody2D = $RestrictedAccess
@onready var pickpocket: CharacterBody2D = $NPCS/NPC3/NpcRoam
@onready var guard: CharacterBody2D = $NPCS/Guard/NpcRoam
@onready var pick_indic: Label = $NPCS/NPC3/NpcRoam/PickIndic
@onready var guard_indic: Label = $NPCS/Guard/NpcRoam/GuardIndic
@onready var kill_label: Label = $CanvasLayer/KillLabel

@onready var kill_area: Area2D = $NPCS/NPC4/NpcRoam/KillArea

@onready var back: ColorRect = $CanvasLayer/Back
@onready var full_note: Sprite2D = $CanvasLayer/FullNote
var in_note : bool = false
var allow_kill : bool = false
var kill_vacinity : bool = false

const MISSION_END = preload("uid://brtmt3juhpp44")

func _ready() -> void:
	GlobalVars.has_key = false

func _input(event: InputEvent) -> void:
	if in_note == false:
		if event.is_action_pressed("Space") and GlobalVars.is_interacting == false:
			camToggle()
	if allow_kill and kill_vacinity:
			var end = MISSION_END.instantiate()
			end.status = "Success"
			end.next_scene = "uid://nrjfmedp5qge"
			add_child(end)
	else:
		if event.is_action_pressed("click"):
			create_tween().tween_property(back, "modulate:a", 0, 0.5)
			create_tween().tween_property(full_note, "modulate:a", 0, 0.5)
			in_note = false
			
			kill_area.monitoring = true
			allow_kill = true
			

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

func _on_kill_area_body_entered(body: Node2D) -> void:
	if body is Player:
		kill_label.show()
		kill_vacinity = true

func _on_kill_area_body_exited(body: Node2D) -> void:
	if body is Player:
		kill_label.hide()
		kill_vacinity = false
		
func show_note():
	create_tween().tween_property(back, "modulate:a", 0.5, 0.5)
	create_tween().tween_property(full_note, "modulate:a", 1, 0.5)
	
	in_note = true
	allow_kill = true
	set_process_input(true)
	
