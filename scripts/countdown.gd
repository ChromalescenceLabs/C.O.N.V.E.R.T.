extends Node2D
@onready var timer_label: Label = $TimerLabel
@onready var timer: Timer = $Timer
@onready var pulse_timer: Timer = $PulseTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var mins : int

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
		pulse_timer.start()

func _on_pulse_timer_timeout() -> void:
	animation_player.play("pulse")
