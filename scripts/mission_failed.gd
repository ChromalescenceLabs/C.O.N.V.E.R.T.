extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var failsafe: RichTextLabel = $FAILSAFE
@onready var failed: RichTextLabel = $FAILED
@onready var reenlist: Button = $Reenlist

func _ready() -> void:
	failsafe.modulate.a = 0

func _show_fail():
	await get_tree().create_timer(0.5).timeout
	
	animation_player.play("failsafe_flash")
	
	await animation_player.animation_finished
	await get_tree().create_timer(0.5).timeout
	
	var tw = create_tween().tween_property(failed, "modulate:a", 1, 1)
	await tw.finished
	
	await get_tree().create_timer(0.5).timeout
	create_tween().tween_property(reenlist, "modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	
	reenlist.disabled = false
	reenlist.mouse_filter = Control.MOUSE_FILTER_STOP
	
