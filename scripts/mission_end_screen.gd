extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var mission_failed: Node2D = $MissionFailed
@onready var mission_success: Node2D = $MissionSuccess

var status = "Fail"
var next_scene

@onready var failsafe: RichTextLabel = $MissionFailed/FAILSAFE
@onready var failed: RichTextLabel = $MissionFailed/FAILED
@onready var reenlist: Button = $MissionFailed/Reenlist
@onready var success: RichTextLabel = $MissionSuccess/SUCCESS
@onready var handler: RichTextLabel = $MissionSuccess/HANDLER
@onready var proceed: Button = $MissionSuccess/Proceed

func _ready() -> void:
	get_tree().paused = true
	var tw = create_tween().tween_property(color_rect, "modulate:a", 1, 0.5)
	await tw.finished
	
	if status == "Fail":
		mission_failed._show_fail()
	else:
		mission_success._show_success()


func _on_reenlist_pressed() -> void:
	get_tree().paused = false
	create_tween().tween_property(failsafe, "modulate:a", 0, 0.5)
	create_tween().tween_property(failed, "modulate:a", 0, 0.5)
	create_tween().tween_property(reenlist, "modulate:a", 0, 0.5)
	SceneLoader.load_scene(String(get_tree().current_scene.scene_file_path), 1)

func _on_proceed_pressed() -> void:
	get_tree().paused = false
	create_tween().tween_property(success, "modulate:a", 0, 0.5)
	create_tween().tween_property(handler, "modulate:a", 0, 0.5)
	create_tween().tween_property(proceed, "modulate:a", 0, 0.5)
	SceneLoader.load_scene(next_scene, 1)
	
