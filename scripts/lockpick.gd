#credits to blackwater gator studios on yt for the tutorial
extends CharacterBody2D
@onready var lPick = self.position
var canPick = true
var activePin: Node2D = null

func _physics_process(delta: float) -> void:
	self.position.x = lerp(self.position.x, lPick.x, 15.0 * delta)
	self.position.y = lerp(self.position.y, lPick.y, 15.0 * delta)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Left") and canPick:
		lPick.x = max(lPick.x - 40, 94)
	
	elif Input.is_action_just_pressed("Right") and canPick:
		lPick.x = min(lPick.x + 40, 214.0)

	elif Input.is_action_just_pressed("Up"):
		canPick = false
		lPick.y = 85
		await get_tree().create_timer(.2).timeout
		lPick.y = 97
		canPick = true
	
	elif Input.is_action_just_pressed("Space"):
		if activePin != null:
			if activePin.canLock == true:
				activePin.isLocked = true
				var unlock = true
				for pin in get_tree().get_nodes_in_group("unlockedPins"):
					if pin.isLocked == false:
						unlock = false
						break
				if unlock == true:
					GlobalVars.is_interacting = false
					get_parent().queue_free()
					
		else:
			for pin in get_tree().get_nodes_in_group("unlockedPins"):
				pin.reset()
			setActivePin(null)

func setActivePin(pin: Node2D):
	activePin = pin
