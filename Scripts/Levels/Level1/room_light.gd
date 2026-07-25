extends Node2D

@onready var room_1: PointLight2D = $Room1
@onready var room_2: PointLight2D = $Room2
@onready var room_3: PointLight2D = $Room3
@onready var room_4: PointLight2D = $Room4


func _ready() -> void:
	$Room1.enabled = false
	$Room2.enabled = false
	$Room3.enabled = false
	$Room4.enabled = false
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
		print("HEY")
	else:
		$Room4.enabled = false


func _on_r_5_body_entered(body: Node2D) -> void:
	if body is Player:
		$Room5.enabled = true
		print("HEY")
	else:
		$Room5.enabled = false


func _on_r_1_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room1.enabled = false
		print($Room1.enabled)


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
		print("BYE")


func _on_r_5_body_exited(body: Node2D) -> void:
	if body is Player:
		$Room5.enabled = false
		print("BYE")
