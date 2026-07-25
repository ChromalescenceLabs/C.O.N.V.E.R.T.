#main screen
extends Control
@onready var redL = $redLight
@onready var blueL = $blueLight
@onready var title = $MainTexts/Ttitle
@onready var anim =$AnimationPlayer
@onready var bloody  =$bloodyhp
@onready var mainTexts: Control = $MainTexts
@onready var optionsMenu: Panel = $OptionsMenu

#BRO I LITERALLY ADDED OPTIONS MENU LAYOUT 
#BUT I DONT THINK I HAVE THE TIME TO CODE THIS BRO
#SO YEAH SHHHH

func _ready() -> void:
	bloody.hide()
	mainTexts.show()
	$MainTexts/Options.hide()
	optionsMenu.hide()
	flickerLights()
	flickerTitle()
	appearBloodyHP()


func appearBloodyHP():
	while true:
		await get_tree().create_timer(randf_range(4.0, 7.0)).timeout
		var limit = get_viewport_rect().size
		bloody.position = Vector2(randf_range(50, limit.x - 50), randf_range(100, limit.y - 50))
		bloody.show()
		await get_tree().create_timer(2).timeout
		bloody.hide()

func flickerLights():
	while true:
		redL.show()
		blueL.hide()
		await get_tree().create_timer(1).timeout
		blueL.show()
		redL.hide()
		await get_tree().create_timer(1).timeout

func flickerTitle():
	while true:
		anim.play("flickerTitle") 
		await get_tree().create_timer(randi_range(3,6)).timeout

func _on_start_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Levels/level1.tscn", 0)
		
func _on_options_pressed() -> void:
	mainTexts.hide()
	optionsMenu.show()

func _on_quit_pressed() -> void:
	get_tree().quit() 
