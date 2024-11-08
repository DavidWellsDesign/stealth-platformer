extends Area2D

var travelled_distance = 0

var direction = Vector2.RIGHT

@export var max_speed = 100
@export var current_speed = 0
@export var max_range = 1200

func _ready():
	current_speed = max_speed # Start at max speed
	
	if Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT

func _physics_process(delta):
	pass
	#const SPEED = 1000 Don't want to use Const as these values will change
	#const RANGE = 1200
	
	#position += direction * current_speed * delta
	#
	#travelled_distance += current_speed * delta
	#if travelled_distance > max_range:
		#queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
