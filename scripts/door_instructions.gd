extends Area2D
@onready var lockpick_label: Label = $"../../../CanvasLayer/LockpickLabel"

func _process(delta: float) -> void:
	if get_parent().opened == true:
		self.monitoring = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		lockpick_label.show()

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		lockpick_label.hide()
