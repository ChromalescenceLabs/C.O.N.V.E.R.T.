extends Node2D

@export var room_1: PointLight2D
@export var room_2: PointLight2D
@export var room_3: PointLight2D
@export var room_4: PointLight2D
@export var room_4_1: PointLight2D
@export var room_5: PointLight2D



func _ready() -> void:
	$Room1.energy = 0.0
	$Room2.energy = 0.0
	$Room3.energy = 0.0
	$Room4.energy = 0.0
	$Room4_1.energy = 0.0
	$Room5.energy = 0.0


func fade_light(light: PointLight2D, target_energy: float, duration: float):
	var tween = create_tween()
	tween.tween_property(light, "energy", target_energy, duration)


func _on_r_1_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room1, 1.0, 0.25)
		print("HEY")
	else:
		$Room1.energy = 0.0


func _on_r_2_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room2, 1.0, 0.25)
		print("HEY")
	else:
		$Room2.energy = 0.0


func _on_r_3_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room3, 1.0, 0.25)
		print("HEY")
	else:
		$Room3.energy = 0.0


func _on_r_4_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room4, 1.0, 0.25)
		fade_light($Room4_1, 1.0, 0.25)
		print("HEY")
	else:
		$Room4.energy = 0.0
		$Room4_1.energy = 0.0


func _on_r_5_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room5, 1.0, 0.25)
		print("HEY")
	else:
		$Room5.energy = 0.0


func _on_r_1_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room1, 0.0, 0.25)
		print("BYE")


func _on_r_2_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room2, 0.0, 0.25)
		print("BYE")


func _on_r_3_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room3, 0.0, 0.25)
		print("BYE")


func _on_r_4_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room4, 0.0, 0.25)
		fade_light($Room4_1, 0.0, 0.25)
		print("BYE")


func _on_r_5_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room5, 0.0, 0.25)
		print("BYE")
