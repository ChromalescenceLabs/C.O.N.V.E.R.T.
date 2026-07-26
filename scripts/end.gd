extends Node2D
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var rich_text_label_2: RichTextLabel = $RichTextLabel2
@onready var rich_text_label_3: RichTextLabel = $RichTextLabel3
@onready var canine_logo: Sprite2D = $CanineLogo
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	
	rich_text_label.show()
	
	await get_tree().create_timer(4.0).timeout
	
	rich_text_label.hide()
	
	await get_tree().create_timer(1.0).timeout
	
	rich_text_label_2.show()
	
	await get_tree().create_timer(4.0).timeout
	
	rich_text_label_2.hide()
	
	await get_tree().create_timer(1.0).timeout
	
	rich_text_label_3.show()
	
	await get_tree().create_timer(3.0).timeout
	
	create_tween().tween_property(rich_text_label_3, "modulate:a", 0, 1).set_ease(Tween.EASE_IN_OUT)
	create_tween().tween_property(canine_logo, "modulate:a", 1, 1).set_ease(Tween.EASE_IN_OUT)
	animation_player.play("growl")
