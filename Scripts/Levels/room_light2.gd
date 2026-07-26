extends Node2D

@export var room_1: PointLight2D
@export var room_1_1: PointLight2D
@export var room_1_2: PointLight2D
@export var room_2: PointLight2D
@export var room_3: PointLight2D
@export var room_3_1: PointLight2D
@export var room_4: PointLight2D
@export var room_5: PointLight2D
@export var room_5_1: PointLight2D
@export var room_6: PointLight2D
@export var room_7: PointLight2D
@export var room_8: PointLight2D


func _ready() -> void:
	$Room1.energy = 0.0
	$Room1_1.energy = 0.0
	$Room1_2.energy = 0.0
	$Room2.energy = 0.0
	$Room3.energy = 0.0
	$Room3_1.energy = 0.0
	$Room4.energy = 0.0
	$Room5.energy = 0.0
	$Room5_1.energy = 0.0
	$Room6.energy = 0.0
	$Room7.energy = 0.0
	$Room8.energy = 0.0


func fade_light(light: PointLight2D, target_energy: float, duration: float):
	var tween = create_tween()
	tween.tween_property(light, "energy", target_energy, duration)


func _on_r_1_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room1, 1.0, 0.25)
		fade_light($Room1_1, 1.0, 0.25)
		fade_light($Room1_2, 1.0, 0.25)
		print("HEY")
	else:
		$Room1.energy = 0.0
		$Room1_1.energy = 0.0
		$Room1_2.energy = 0.0


func _on_r_2_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room2, 1.0, 0.25)
		print("HEY")
	else:
		$Room2.energy = 0.0


func _on_r_3_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room3, 1.0, 0.25)
		fade_light($Room3_1, 1.0, 0.25)
		print("HEY")
	else:
		$Room3.energy = 0.0
		$Room3_1.energy = 0.0


func _on_r_4_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room4, 1.0, 0.25)
		print("HEY")
	else:
		$Room4.energy = 0.0


func _on_r_5_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room5, 1.0, 0.25)
		fade_light($Room5_1, 1.0, 0.25)
		print("HEY")
	else:
		$Room5.energy = 0.0
		$Room5_1.energy = 0.0


func _on_r_6_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room6, 1.0, 0.25)
		print("HEY")
	else:
		$Room6.energy = 0.0


func _on_r_7_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room7, 1.0, 0.25)
		print("HEY")
	else:
		$Room7.energy = 0.0


func _on_r_8_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room8, 1.0, 0.25)
		print("HEY")
	else:
		$Room8.energy = 0.0



func _on_r_1_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room1, 0.0, 0.25)
		fade_light($Room1_1, 0.0, 0.25)
		fade_light($Room1_2, 0.0, 0.25)
		print($Room1.enabled)


func _on_r_2_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room2, 0.0, 0.25)
		print("BYE")


func _on_r_3_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room3, 0.0, 0.25)
		fade_light($Room3_1, 0.0, 0.25)
		print("BYE")


func _on_r_4_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room4, 0.0, 0.25)
		print("BYE")


func _on_r_5_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room5, 0.0, 0.25)
		fade_light($Room5_1, 0.0, 0.25)
		print("BYE")


func _on_r_6_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room6, 0.0, 0.25)
		print("BYE")


func _on_r_7_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room7, 0.0, 0.25)
		print("BYE")


func _on_r_8_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room8, 0.0, 0.25)
		print("BYE")
