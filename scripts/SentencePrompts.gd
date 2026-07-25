#credits to jmbiv on yt for the tutorial
extends Node

var prompt = [
	"Hello Everybody I like you bro GGs!",
	"Why is the sea glowing?",
	"If you have to betray one person to save a thousand, would you?",
	"Omg skeppy, I'm so happy I could kiss you rn!",
	"Death, such a small word for such a big thing.",
	"My sole wish is to just go home...",
	"Water is good, Llyod is water, Lloyd is good!",
	"You want to know who Bam is? Bam is just Bam.",
	"Dojka. Starting now, we're going to read everything again.",
	"Avery, what's in your inventory?",
	"And apparently, Mech was here."
]

func getPrompt() -> String:
	var wordInd = randi() % prompt.size()
	return prompt[wordInd]
