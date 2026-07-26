# credits to DevDrache for the yt turotial
# but I mostly used the code from hacking scene tho
extends Control

@onready var colorR = %ColorRect
@onready var key = $ColorRect/Key
@onready var success = %Success
@onready var bgRound = $bg/round
@export var eventDuration := 0.5
@onready var anim: AnimationPlayer = $AnimationPlayer

var letterNum = 0
var maxLetterNum = randi_range(3, 6)
var tween: Tween
var successA = 0.0 
var ogPos = position
var done = false
var is_active = true

signal doneQTE(val:bool)

func _ready() -> void:
	success.modulate.a = 0.0
	anim.play("fade in")
	await anim.animation_finished
	done = false
	is_active = true
	runAgain()

func _process(delta: float) -> void:
	bgRound.parse_bbcode("Round: " + str(letterNum) + "/" + str(maxLetterNum))
	if successA > 0.0:
		successA = lerp(successA, 0.0, 2.0 * delta)
		success.modulate.a = successA

func runAgain() -> void:
	if not is_active: return 
	
	var limit = get_viewport_rect().size - colorR.size
	colorR.position = Vector2(randf_range(50, limit.x - 50), randf_range(100, limit.y - 50))

	start()
	await _animation()
	if not is_active: return
	
	print("uh oh")
	shake()
	letterNum = 0 
	colorR.material.set_shader_parameter("value", 1.0) 
	maxLetterNum = randi_range(3, 6) 
	runAgain()

func start() -> void:
	var randomKey = char(randi_range(65, 90))
	key.text = randomKey
	key.parse_bbcode(randomKey)

func _animation():
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_property(colorR, "material:shader_parameter/value", 0.0, randi_range(1.0,3.0))
	await tween.finished

func _input(event: InputEvent) -> void:
	if not is_active: return 
	
	if event is InputEventKey and event.is_pressed() and not event.is_echo() and event.unicode > 0:
		var keyTyped = char(event.unicode)

		if keyTyped.to_upper() == key.text and successA != 1.0:
			letterNum += 1

			if letterNum < maxLetterNum:
				print("yes " + str(letterNum) + "/" + str(maxLetterNum))
				if tween:
					tween.kill()
				successA = 1.0
				success.modulate.a = 1.0
				colorR.material.set_shader_parameter("value", 1.0)
				runAgain()
			else:
				is_active = false
				done = true
				
				if tween:
					tween.kill()
				
				anim.play("fade out")
				await anim.animation_finished

				doneQTE.emit(true)
				print("TAPOS NA")
				queue_free()

		else:
			print("its %s not %s" % [key.text, keyTyped])
			shake()

func shake():
	var sTween = create_tween()
	var shakeInt = 8.0
	var shakeSpeed = 0.04

	sTween.tween_property(self, "position:x", ogPos.x - shakeInt, shakeSpeed)
	sTween.tween_property(self, "position:x", ogPos.x + shakeInt, shakeSpeed)
	sTween.tween_property(self, "position:x", ogPos.x - shakeInt, shakeSpeed)
	sTween.tween_property(self, "position:x", ogPos.x, shakeSpeed)
