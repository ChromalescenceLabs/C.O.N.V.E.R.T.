extends Node2D
@onready var timer_label: Label = $TimerLabel
@onready var timer: Timer = $Timer
@export var mins : int

func _ready() -> void:
	timer.wait_time = mins * 60

func _process(_delta: float) -> void:
	if not timer.is_stopped():
		var time_left : float = timer.time_left
		@warning_ignore("integer_division")
		var minutes : int = int(time_left) / 60
		var seconds : int = int(time_left) % 60
		
		timer_label.text = "%02d:%02d" % [minutes, seconds]
	else:
		timer_label.text = "00:00"
