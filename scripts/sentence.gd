#credits to jmbiv on yt for the tutorial
extends ColorRect

@onready var sentence = $RichTextLabel
@onready var text = sentence.text

@export var past= Color("8bdfb4ff")
@export var present= Color("7ad0e5ff")
@export var future= Color("9c98c6ff")
@export var bg = Color("2a2a41ff")

func _ready() -> void:
	start()

func start() -> void:
	text = SentencePrompts.getPrompt()
	sentence.parse_bbcode("[center]" + text + "[/center]")

func getPrompt() -> String:
	return text

func setNextChar(nextCharInd: int):
	var pastText = getColorTag(past) + text.substr(0, nextCharInd) + "[/color]"
	var presentText = "[bgcolor=#" + bg.to_html(false) + "][pulse freq=2 color=#ffffff00]" + getColorTag(present) + text.substr(nextCharInd, 1) + "[/color][/pulse][/bgcolor]"
	var futureText = ""
	if nextCharInd != text.length():
		futureText = getColorTag(future) + text.substr(nextCharInd + 1, text.length() - nextCharInd) + "[/color]"
	sentence.parse_bbcode("[center]" + pastText + presentText + futureText + "[/center]")


func getColorTag(color: Color):
	return "[color=#" + color.to_html(false) + "]"

func shake():
	var tween = create_tween()
	var ogPos = position
	var shakeInt = 8.0
	var shakeSpeed = 0.04

	tween.tween_property(self, "position:x", ogPos.x - shakeInt, shakeSpeed)
	tween.tween_property(self, "position:x", ogPos.x + shakeInt, shakeSpeed)
	tween.tween_property(self, "position:x", ogPos.x - shakeInt, shakeSpeed)
	tween.tween_property(self, "position:x", ogPos.x, shakeSpeed)
