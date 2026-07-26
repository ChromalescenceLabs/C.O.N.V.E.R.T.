#credits to blackwater gator studios on yt for the tutorial
extends Node2D
var posPin = 56.0
var canLock = false
var isLocked = false

func _physics_process(delta: float) -> void:
	self.position.y = lerp(self.position.y, posPin, 15.0 * delta)

func _ready() -> void:
	add_to_group("unlockedPins")

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.setActivePin(self)
	posPin = 13.0
	await get_tree().create_timer(.05).timeout
	canLock = true
	await get_tree().create_timer(randf_range(.05, .5)).timeout
	
	if isLocked==false:
		canLock= false
		posPin = 56.0
	
	body.call_deferred("setActivePin", null)

func reset():
	posPin = 56.0
	canLock = false
	isLocked= false
