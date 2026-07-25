extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var mission_failed: Node2D = $MissionFailed

var status = "Fail"

func _ready() -> void:
	get_tree().paused = true
	var tw = create_tween().tween_property(color_rect, "modulate:a", 1, 0.5)
	await tw.finished
	
	if status == "Fail":
		mission_failed._show_fail()


func _on_reenlist_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
