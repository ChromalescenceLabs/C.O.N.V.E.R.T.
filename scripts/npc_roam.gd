extends CharacterBody2D

@export var texture : Texture2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D

var speed : float = 100
enum STATE { IDLE, PATH, DISTRACTED, TARGET }
var current_state : STATE = STATE.PATH
var current_pos : Vector2
var stay = false
var tween: Tween
var isChasing: bool = false 
var player
var being_detected : bool = false
var stunned : bool = false

const MISSION_END = preload("uid://brtmt3juhpp44")

@export var points : Array[Marker2D]
@export var mintime : int = 0
@export var maxtime : int = 0

func _ready() -> void:
	sprite_2d.texture = texture

func _physics_process(_delta: float) -> void:
	_state_set()
	_navigate()

func _pick_point():
	var randpoint = points.pick_random()
	if randpoint.global_position != current_pos and not randpoint.name == "Distraction":
		nav.target_position = randpoint.global_position
		current_pos = randpoint.global_position

func _state_set() -> void:
	if nav.is_navigation_finished() and current_state == STATE.PATH:
		_pick_point()
	elif current_state == STATE.DISTRACTED:
		nav.target_position = points.back().global_position
		current_pos = points.back().global_position
	elif current_state == STATE.IDLE:
		return

func _navigate():
	match current_state:
		STATE.PATH:
			speed = 100
		STATE.IDLE:
			speed = 0
		STATE.DISTRACTED:
			speed = 100

#moved because i noticed they have similar logic
	if current_state != STATE.IDLE:
		var next_path_position: Vector2 = nav.get_next_path_position()
		velocity = (
			global_position.direction_to(next_path_position) * speed
		)
		
		nav.velocity = velocity

func _on_navigation_agent_2d_target_reached() -> void:
	if current_state == STATE.DISTRACTED and stay == true:
		current_state = STATE.IDLE
		return
	else:
		current_state = STATE.IDLE
		await get_tree().create_timer(randi_range(mintime, maxtime)).timeout
		
		if current_state != STATE.DISTRACTED:
			current_state = STATE.PATH


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
	
	if velocity.length() > 0.1:
		sprite_2d.rotation = velocity.angle() - (TAU / 4)
