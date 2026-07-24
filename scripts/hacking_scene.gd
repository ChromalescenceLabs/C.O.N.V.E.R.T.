#credits to jmbiv on yt for the tutorial
#delete the print thing if u want idk
extends Node2D
var currentLetterInd = 0
var randomSentence = randi_range(1,3)
var sentenceNum = 0

func _ready() -> void:
	$Sentence.setNextChar(currentLetterInd)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_echo() and event.unicode > 0:
		var keyTyped= char(event.unicode)
		
		var prompt = $Sentence.getPrompt()
		var nextChar = prompt.substr(currentLetterInd, 1)
		if keyTyped == nextChar:
			print("yay correct")
			currentLetterInd += 1
			$Sentence.setNextChar(currentLetterInd)
			
			if currentLetterInd == prompt.length():
				sentenceNum += 1
				
				if sentenceNum <= randomSentence:
					currentLetterInd = 0
					$Sentence.start()
					$Sentence.setNextChar(currentLetterInd)
				else:
					print ("done")
		else:
			print("its %s not %s" % [nextChar,keyTyped])
			$Sentence.shake() 
