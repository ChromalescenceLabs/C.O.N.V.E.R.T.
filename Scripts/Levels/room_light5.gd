extends Node2D

@onready var room_1: PointLight2D = $Room1
@onready var room_2: PointLight2D = $Room2
@onready var room_2_1: PointLight2D = $Room2_1
@onready var room_2_2: PointLight2D = $Room2_2
@onready var room_2_3: PointLight2D = $Room2_3
@onready var room_2_4: PointLight2D = $Room2_4
@onready var room_3: PointLight2D = $Room3
@onready var room_4: PointLight2D = $Room4
@onready var room_5: PointLight2D = $Room5
@onready var room_6: PointLight2D = $Room6
@onready var room_7: PointLight2D = $Room7
@onready var room_8: PointLight2D = $Room8
@onready var room_9: PointLight2D = $Room9
@onready var room_10: PointLight2D = $Room10


func _ready() -> void:
	$Room1.energy = 0.0
	$Room2.energy = 0.0
	$Room2_1.energy = 0.0
	$Room2_2.energy = 0.0
	$Room2_3.energy = 0.0
	$Room2_4.energy = 0.0
	$Room3.energy = 0.0
	$Room4.energy = 0.0
	$Room5.energy = 0.0
	$Room6.energy = 0.0
	$Room7.energy = 0.0
	$Room8.energy = 0.0
	$Room9.energy = 0.0
	$Room10.energy = 0.0


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
		fade_light($Room2_1, 1.0, 0.25)
		fade_light($Room2_2, 1.0, 0.25)
		fade_light($Room2_3, 1.0, 0.25)
		fade_light($Room2_4, 1.0, 0.25)
		print("HEY")
	else:
		$Room2.energy = 0.0
		$Room2_1.energy = 0.0
		$Room2_2.energy = 0.0
		$Room2_3.energy = 0.0
		$Room2_4.energy = 0.0


func _on_r_3_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room3, 1.0, 0.25)
		print("HEY")
	else:
		$Room3.energy = 0.0


func _on_r_4_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room4, 1.0, 0.25)
		print("HEY")
	else:
		$Room4.energy = 0.0


func _on_r_5_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room5, 1.0, 0.25)
		print("HEY")
	else:
		$Room5.energy = 0.0


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


func _on_r_9_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room9, 1.0, 0.25)
		print("HEY")
	else:
		$Room9.energy = 0.0


func _on_r_10_body_entered(body: Node2D) -> void:
	if body is Player:
		fade_light($Room10, 1.0, 0.25)
		print("HEY")
	else:
		$Room10.energy = 0.0


func _on_r_1_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room1, 0.0, 0.25)
		print("BYE")


func _on_r_2_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room2, 0.0, 0.25)
		fade_light($Room2_1, 0.0, 0.25)
		fade_light($Room2_2, 0.0, 0.25)
		fade_light($Room2_3, 0.0, 0.25)
		fade_light($Room2_4, 0.0, 0.25)
		print("BYE")


func _on_r_3_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room3, 0.0, 0.25)
		print("BYE")


func _on_r_4_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room4, 0.0, 0.25)
		print("BYE")


func _on_r_5_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room5, 0.0, 0.25)
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


func _on_r_9_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room9, 0.0, 0.25)
		print("BYE")


func _on_r_10_body_exited(body: Node2D) -> void:
	if body is Player:
		fade_light($Room10, 0.0, 0.25)
		print("BYE")
