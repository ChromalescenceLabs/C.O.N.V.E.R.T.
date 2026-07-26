extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var interact = $interact
@onready var intButton =$interact/intButton
@onready var circle = $CIRCLE

var speed : float = 100
enum STATE { IDLE, PATH, DISTRACTED, TARGET }
var current_state : STATE = STATE.PATH
var current_pos : Vector2
var stay = false
var tween: Tween
var isChasing: bool = false 
var player
var detection
var playerInt = false
var playerNear = false

@export var points : Array[Marker2D]
@export_enum("NPC", "TARGET", "GUARD") var type: String = "GUARD"

const qte = preload("res://scenes/qte.tscn")

func _ready() -> void:
	circle.modulate.a = 0.0
	player = get_node_or_null("../Player")
	intButton.hide()
	
	match type:
		"NPC":
			interact.show()
			$Sprite2D/guard.hide()
			$Sprite2D/target.hide()
		"TARGET":
			detection = $Sprite2D/target
			detection.show()
			$Sprite2D/guard.hide()
			interact.show()
		"GUARD":
			detection =$Sprite2D/guard
			detection.show()
			$Sprite2D/target.hide()
	_pick_point()

func _physics_process(_delta: float) -> void:
	_state_set()
	_navigate()

	if Input.is_action_just_pressed("Interact") and not playerInt and playerNear:
		playerInt = true
		intButton.hide() 
		var previous_state = current_state
		current_state = STATE.IDLE
		
		var overlay = qte.instantiate()
		get_parent().add_child(overlay)

		await overlay.get_node("Control").doneQTE
		
		var is_minigame_successful = overlay.get_node("Control").done
		
		if is_minigame_successful:
			if type == "TARGET":
				pass # kill
			else:
				_alert_guards_in_scene()
				if type == "GUARD":
					current_state = STATE.DISTRACTED
					nav.target_position = points.back().global_position
					current_pos = points.back().global_position

		current_state = previous_state
		playerInt = false



func _pick_point():
	if points.size() == 0: return
	var randpoint = points.pick_random()
	if randpoint.global_position != current_pos and not randpoint.name == "Distraction":
		nav.target_position = randpoint.global_position
		current_pos = randpoint.global_position

func _state_set() -> void:
	# FIX: Clean separation of behavior roles
	if type != "GUARD":
		if current_state == STATE.DISTRACTED:
			current_state = STATE.PATH
			_pick_point()
		elif nav.is_navigation_finished() and current_state == STATE.PATH:
			_pick_point()
		return


	if nav.is_navigation_finished() and current_state == STATE.PATH:
		_pick_point()
	elif current_state == STATE.DISTRACTED:
		nav.target_position = points.back().global_position
		current_pos = points.back().global_position
	elif current_state == STATE.TARGET and player:
		nav.target_position = player.global_position

func _navigate():
	match current_state:
		STATE.PATH, STATE.DISTRACTED:
			speed = 100
		STATE.IDLE:
			speed = 0
		STATE.TARGET:
			speed = 80

	if current_state != STATE.IDLE or isChasing:
		var next_path_position: Vector2 = nav.get_next_path_position()
		velocity = global_position.direction_to(next_path_position) * speed
		
		if velocity.length() > 0.1:
			var finalAngle = velocity.angle() - (TAU / 4)
			sprite_2d.rotation = lerp_angle(sprite_2d.rotation, finalAngle, 0.05)
		move_and_slide()

func _on_navigation_agent_2d_target_reached() -> void:
	if isChasing:
		return 
		
	if current_state == STATE.DISTRACTED and stay == true:
		if tween: 
			tween.kill()
		circle.modulate.a = 1.0
		tween = create_tween()
		tween.tween_property(circle, "material:shader_parameter/value", 0.0, 1.0)
		tween.finished.connect(distractDone)
		set_physics_process(false)
		return
	else:
		current_state = STATE.IDLE
		set_physics_process(false)
		await get_tree().create_timer(randi_range(4, 5)).timeout
		set_physics_process(true)

		if not isChasing:
			current_state = STATE.PATH
			_pick_point()

#Distract
func distractDone():
	if current_state == STATE.DISTRACTED:
		circle.modulate.a = 0.0
		current_state = STATE.PATH
		_pick_point()

func _alert_guards_in_scene() -> void:
	var entities = get_parent().get_children()
	for entity in entities:
		if entity != self and entity.has_method("trigger_guard_distraction"):
			entity.trigger_guard_distraction()

func trigger_guard_distraction() -> void:
	if type == "GUARD":
		current_state = STATE.DISTRACTED
		nav.target_position = points.back().global_position
		current_pos = points.back().global_position

# Detect
func _on_guard_body_entered(body: Node2D) -> void:
	if body == player and type == "GUARD": entered()

func _on_guard_body_exited(body: Node2D) -> void:
	if body == player and type == "GUARD": exited()

func _on_target_body_entered(body: Node2D) -> void:
	if body == player and type == "TARGET": entered()

func _on_target_body_exited(body: Node2D) -> void:
	if body == player and type == "TARGET": exited()

func entered():
	if tween: tween.kill()
	circle.modulate.a = 1.0
	tween = create_tween()
	tween.tween_property(circle, "material:shader_parameter/value", 0.0, 1.0)
	tween.finished.connect(tweenTarget)

func exited():
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_property(circle, "material:shader_parameter/value", 1.0, 3.0)
	tween.finished.connect(tweenPath)

func tweenTarget():
	isChasing = true
	current_state = STATE.TARGET
	if player:
		nav.target_position = player.global_position

func tweenPath():
	isChasing = false
	current_state = STATE.PATH
	circle.modulate.a = 0.0
	_pick_point()

# Interact
func _on_interact_body_entered(body: Node2D) -> void:
	if body == player and type != "GUARD":
		playerNear = true
		intButton.show()

func _on_interact_body_exited(body: Node2D) -> void:
	if body == player and type != "GUARD":
		playerNear = false
		intButton.hide()
