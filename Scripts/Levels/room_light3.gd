extends Node2D

@export var room_1: PointLight2D
@export var room_2: PointLight2D
@export var room_3: PointLight2D
@export var room_4: PointLight2D
@export var room_4_1: PointLight2D
@export var room_5: PointLight2D



func _ready() -> void:
	$Room1.enabled = false
	$Room2.enabled = false
	$Room3.enabled = false
	$Room4.enabled = false
	$Room4_1.enabled = false
	$Room5.enabled = false



func _on_r_1_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room1.enabled = true
		print("HEY")
	else:
		$Room1.enabled = false


func _on_r_2_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room2.enabled = true
		print("HEY")
	else:
		$Room2.enabled = false


func _on_r_3_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room3.enabled = true
		print("HEY")
	else:
		$Room3.enabled = false


func _on_r_4_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room4.enabled = true
		$Room4_1.enabled = true
		print("HEY")
	else:
		$Room4.enabled = false
		$Room4_1.enabled = false


func _on_r_5_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room5.enabled = true
		print("HEY")
	else:
		$Room5.enabled = false


func _on_r_1_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room1.enabled = false
		print("BYE")


func _on_r_2_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room2.enabled = false
		print("BYE")


func _on_r_3_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room3.enabled = false
		print("BYE")


func _on_r_4_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room4.enabled = false
		$Room4_1.enabled = false
		print("BYE")


func _on_r_5_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room5.enabled = false
		print("BYE")
