#credits to blackwater gator studios on yt for the tutorial
#so you have to hit space when the pin is up in order to lock em. 
#if u mess up, have a chance for the pins reset
extends Node2D

@export var lockedPin: PackedScene
@export var unlockedPin: PackedScene

enum Difficulties {
	Easy,
	Normal,
	Hard,
	Difficult
}

var lockDifficulties:Difficulties = Difficulties.values().pick_random()

var lockedPos: Array[Vector2] = [
	Vector2(85,13),
	Vector2(125,13),
	Vector2(165,13),
	Vector2(205,13)
]

var unlockedPos: Array[Vector2] = [
	Vector2(85,56),
	Vector2(125,56),
	Vector2(165,56),
	Vector2(205,56)
]

func _ready() -> void:
	print("Difficulty: ", Difficulties.keys()[lockDifficulties])
	var lock:Array[int]
	for i:int in range(lockDifficulties + 1):
		lock.append(1)
	while lock.size() < 4:
		lock.append(2)
	print(lock)
	
	for i:int in range(lock.size()):
		match lock[i]:
			1:
				var unPin = unlockedPin.instantiate()
				unPin.position = unlockedPos[i]
				add_child(unPin)
			2:
				var locPin = lockedPin.instantiate()
				locPin.position = lockedPos[i]
				add_child(locPin)
