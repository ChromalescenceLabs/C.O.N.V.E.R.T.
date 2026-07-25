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
	$Room1.enabled = false
	$Room1_1.enabled = false
	$Room1_2.enabled = false
	$Room2.enabled = false
	$Room3.enabled = false
	$Room3_1.enabled = false
	$Room4.enabled = false
	$Room5.enabled = false
	$Room5_1.enabled = false
	$Room6.enabled = false
	$Room7.enabled = false
	$Room8.enabled = false
	


func _on_r_1_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room1.enabled = true
		$Room1_1.enabled = true
		$Room1_2.enabled = true
		print("HEY")
	else:
		$Room1.enabled = false
		$Room1_1.enabled = false
		$Room1_2.enabled = false


func _on_r_2_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room2.enabled = true
		print("HEY")
	else:
		$Room2.enabled = false


func _on_r_3_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room3.enabled = true
		$Room3_1.enabled = true
		print("HEY")
	else:
		$Room3.enabled = false
		$Room3_1.enabled = false


func _on_r_4_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room4.enabled = true
		print("HEY")
	else:
		$Room4.enabled = false


func _on_r_5_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room5.enabled = true
		$Room5_1.enabled = true
		print("HEY")
	else:
		$Room5.enabled = false
		$Room5_1.enabled = false


func _on_r_6_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room6.enabled = true
		print("HEY")
	else:
		$Room6.enabled = false


func _on_r_7_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room7.enabled = true
		print("HEY")
	else:
		$Room7.enabled = false


func _on_r_8_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room8.enabled = true
		print("HEY")
	else:
		$Room8.enabled = false



func _on_r_1_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room1.enabled = false
		$Room1_1.enabled = false
		$Room1_2.enabled = false
		print($Room1.enabled)


func _on_r_2_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room2.enabled = false
		print("BYE")


func _on_r_3_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room3.enabled = false
		$Room3_1.enabled = false
		print("BYE")


func _on_r_4_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room4.enabled = false
		print("BYE")


func _on_r_5_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room5.enabled = false
		$Room5_1.enabled = false
		print("BYE")


func _on_r_6_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room6.enabled = false
		print("BYE")


func _on_r_7_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room7.enabled = false
		print("BYE")


func _on_r_8_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room8.enabled = false
		print("BYE")
