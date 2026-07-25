extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var detection = $Sprite2D/Area2D
@onready var circle = $CIRCLE

var speed : float = 100
enum STATE { IDLE, PATH, DISTRACTED, TARGET }
var current_state : STATE = STATE.PATH
var current_pos : Vector2
var stay = false
var tween: Tween
var isInRange: bool = false 
var player

@export var points : Array[Marker2D]

func _ready() -> void:
	circle.modulate.a=0

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
	elif current_state == STATE.TARGET and player:
		nav.target_position = player.global_position
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
		STATE.TARGET:
			player = get_node_or_null("../Player")
			speed = 80

#moved because i noticed they have similar logic
	if current_state != STATE.IDLE:
		var next_path_position: Vector2 = nav.get_next_path_position()
		velocity = (
			global_position.direction_to(next_path_position) * speed
		)
		var finalAngle = velocity.angle() - (TAU / 4)
		sprite_2d.rotation = lerp_angle(sprite_2d.rotation, finalAngle, 0.01)
		move_and_slide()


func _on_navigation_agent_2d_target_reached() -> void:
	if current_state == STATE.DISTRACTED and stay == true:
		current_state = STATE.IDLE
		return
	else:
		current_state = STATE.IDLE
		await get_tree().create_timer(randi_range(4, 5)).timeout
		
		if current_state != STATE.DISTRACTED:
			current_state = STATE.PATH


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("RUNNN")
		isInRange = true
		
		if tween:
			tween.kill()
	
		tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(circle, "modulate:a", 1.0, 1.0)
		tween.tween_property(circle, "material:shader_parameter/value", 0.0, 1.0)
		tween.finished.connect(tweenTarget)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		print("Mustve been the wind")

		if tween:
			tween.kill()

		tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(circle, "material:shader_parameter/value", 1.0, 3.0)
		tween.tween_property(circle, "modulate:a", 0.0, 3.0)
		tween.finished.connect(tweenPath)


#please DONT ask why this works, it just does
#you don't know how much i spent on this thing im crashing out
func tweenTarget():
	set_physics_process(true)
	current_state = STATE.TARGET

func tweenPath():
	if current_state== STATE.TARGET:
		set_physics_process(true)
		current_state = STATE.PATH
