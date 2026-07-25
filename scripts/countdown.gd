extends Node2D
@onready var timer_label: Label = $Node2D/TimerLabel
@onready var timer: Timer = $Timer
@onready var pulse_timer: Timer = $PulseTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect
@onready var node_2d: Node2D = $Node2D

@export var mins : int

var shake = false

func _ready() -> void:
	timer.wait_time = mins * 60
	timer.start()

func _process(_delta: float) -> void:
	_check_shake()
	if timer.time_left < 60:
		animation_player.speed_scale += 0.001
		
	if not timer.is_stopped():
		var time_left : float = timer.time_left
		@warning_ignore("integer_division")
		var minutes : int = int(time_left) / 60
		var seconds : int = int(time_left) % 60
		
		timer_label.text = "%02d:%02d" % [minutes, seconds]
	else:
		timer_label.text = "00:00"

func _check_shake():
	if ((timer.time_left < 60) and timer.time_left > 0) and pulse_timer.is_stopped():
		timer_label.add_theme_color_override("font_color", Color(1.0, 0.0, 0.0))
		pulse_timer.start()
		animation_player.play("pulse")
	if timer.time_left < 1:
		animation_player.play("shake")
	

func _on_pulse_timer_timeout() -> void:
	animation_player.play("pulse")

func _on_timer_timeout() -> void:
	create_tween().tween_property(color_rect, "modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	create_tween().tween_property(node_2d, "scale", Vector2(0, 0), 0.5).set_ease(Tween.EASE_IN_OUT)
