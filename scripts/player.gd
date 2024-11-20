extends CharacterBody2D

class_name Player

@export var health:int
@export var stats: Resource

@onready var collision_shape_2d = $CollisionShape2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var wall_check_left = $WallCheckLeft
@onready var wall_check_right = $WallCheckRight
@onready var animation_player = $AnimationPlayer
@onready var sword_point = $AnimatedSprite2D/SwordPoint

@onready var attack_cooldown = $Timers/AttackCooldown
@onready var wall_jump_cooldown = $Timers/WallJumpCooldown
@onready var coyote_timer = $Timers/CoyoteTimer

var knockback = 200

const SPEED = 130.0
const SLIDE_SPEED = 20 # How much the character slides when stopping, lower number should be more

const AIR_SPEED = 30
const JUMP_VELOCITY = -250.0
const AIR_SLOWDOWN = 5 # How fast you lose velocity in the air when releasing a direction

const WALL_JUMP_VELOCITY_X = 200 # Horizontal and vertical velocity for wall jump
const WALL_JUMP_VELOCITY_Y = -200

const DASH_SPEED = 150  # Speed of the dash
const DASH_DURATION = 0.5  # Duration of the dash in seconds

var equipped_weapon = "sword"
var can_attack = true

var player_hidden = false # Used when play hides in a locker

#var wall_jump_cooldown = 0.1  # Cooldown time between wall jumps
var can_wall_jump = true
var is_dashing = false
var dash_timer = 0.0
var coyote_time:bool = false
var was_on_floor:bool = false

signal game_over



func _ready():
	# Set health meter max to starting health NOT USED!
	if stats:
		health =stats.health
		print(health)
		%ProgressBar.max_value = stats.max_health
		%ProgressBar.value = stats.health
	else:
		print("unable to find stats!")

# This isn't used!
func _on_spawn(position: Vector2, direction: String):
	global_position = position
	
	
func _physics_process(delta):

	if player_hidden == false:
		if Input.is_action_just_pressed("attack") and can_attack == true:
			animation_player.play("attack")
			attack_cooldown.start()
			can_attack = false
			
			if not is_on_floor() and Input.is_action_pressed("move_down"):
				sword_point.rotation_degrees = 90
			else:
				if Input.is_action_pressed("move_up"):
					sword_point.rotation_degrees = -90
				else:
					if animated_sprite.flip_h:
						sword_point.rotation_degrees = 180
					else:
						sword_point.rotation_degrees = 0
			
		# Once you leave the ground start the coyote timer
		if was_on_floor && !is_on_floor():
			coyote_timer.start()
			coyote_time = true
		
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_time == true):
			velocity.y = JUMP_VELOCITY
			coyote_time = false

		# Check for coyote time. ToDo: can we add Waluigi time?
		was_on_floor = is_on_floor()

		#if Input.is_action_just_pressed("dodge") and is_on_floor() and not is_dashing:
			#start_dash()
		
		if is_dashing:
			perform_dash(delta)
		else:
			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			var direction = Input.get_axis("move_left", "move_right")
			
			if direction > 0:
				animated_sprite.flip_h = false
			elif direction < 0:
				animated_sprite.flip_h = true
			
			# Play animations
			if is_on_floor():
				if direction == 0:
					animated_sprite.play("idle")
				else:
					animated_sprite.play("run")
			else:
				animated_sprite.play("jump")
			
			if direction:
				if is_on_floor():
					velocity.x = direction * SPEED
				else:
					if (velocity.x < SPEED and direction > 0) or (velocity.x > -SPEED and direction < 0):
						velocity.x += direction * AIR_SPEED
			else:
				if is_on_floor():
					velocity.x = move_toward(velocity.x, 0, SLIDE_SPEED)
				else:
					velocity.x = move_toward(velocity.x, 0, AIR_SLOWDOWN)
			
			# Handle wall jump
			if is_on_wall_only():
				
				if can_wall_jump and Input.is_action_just_pressed("jump"):
					velocity.y = WALL_JUMP_VELOCITY_Y
					if wall_check_left.is_colliding():
						velocity.x = WALL_JUMP_VELOCITY_X
						animated_sprite.flip_h = false
					if wall_check_right.is_colliding():
						velocity.x = -WALL_JUMP_VELOCITY_X
						animated_sprite.flip_h = true
					can_wall_jump = false
					wall_jump_cooldown.start()
	else:
		velocity = Vector2(0,0)
	move_and_slide()

func reset_wall_jump():
	can_wall_jump = true

func apply_powerup():
	print("Powerup applied to player")

func start_dash():
	is_dashing = true
	dash_timer = DASH_DURATION
	# Set dash velocity in the direction the player is facing
	velocity.x = DASH_SPEED * (1 if not animated_sprite.flip_h else -1)
	velocity.y = 0  # Cancel vertical velocity during dash
	animated_sprite.play("dodge")

func perform_dash(delta):
	dash_timer -= delta
	if dash_timer <= 0:
		is_dashing = false
	# During dash, maintain dash velocity
	velocity.x = DASH_SPEED * (1 if not animated_sprite.flip_h else -1)

func take_damage():
	print("OUCH")

func _on_attack_cooldown_timeout():
	can_attack = true

func _on_wall_jump_cooldown_timeout():
	can_wall_jump = true

func _on_hurtbox_body_entered(body):
	stats.health -= 10
	%ProgressBar.value = stats.health
	var direction = position.direction_to(body.position)
	velocity = knockback * - direction
	velocity.y += -300
	if stats.health <= 0:
		game_over.emit()

func _on_locker_hide_player():
	hide()
	player_hidden = true
	collision_shape_2d.set_disabled(true)

func _on_locker_reveal_player():
	show()
	player_hidden = false
	collision_shape_2d.set_disabled(false)

func _on_coyote_timer_timeout():
	coyote_time = false
