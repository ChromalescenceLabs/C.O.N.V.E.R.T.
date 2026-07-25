extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var success: RichTextLabel = $SUCCESS
@onready var handler: RichTextLabel = $HANDLER
@onready var proceed: Button = $Proceed

func _ready() -> void:
	success.modulate.a = 0
	
func _show_success():
	await get_tree().create_timer(0.5).timeout
	
	animation_player.play("success_slam")
	
	await animation_player.animation_finished
	await get_tree().create_timer(0.5).timeout
	
	var tw = create_tween().tween_property(handler, "modulate:a", 1, 1)
	await tw.finished
	
	await get_tree().create_timer(0.5).timeout
	create_tween().tween_property(proceed, "modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	
	proceed.disabled = false
	proceed.mouse_filter = Control.MOUSE_FILTER_STOP
	
