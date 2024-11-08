extends CharacterBody2D

@export var health: int

const SPEED: float         = 30.0
const JUMP_VELOCITY: float = -100.0
const JUMP_SPEED: int   = 100
const ATTACK_RANGE: int = 40
const AGGRO_RANGE: int  = 100

var can_attack: bool    = true
var taking_damage: bool = false

@onready var player = %Player
@onready var animated_sprite_2d = $AnimatedSprite2D

# Timers
@onready var attack_cooldown = %AttackCooldown
@onready var stun_time = %StunTime
@onready var despawn = %Despawn

func _physics_process(delta):
	# Freeze when taking damage
	if taking_damage == false:
		if not is_on_floor():
			velocity += get_gravity() * delta

		if position.distance_to(player.position) < AGGRO_RANGE:
			position = position.move_toward(player.position, delta*SPEED)

		if position.distance_to(player.position) < ATTACK_RANGE and is_on_floor() and can_attack == true:
			velocity.y = JUMP_VELOCITY
			if position.x < player.position.x:
				velocity.x = JUMP_SPEED
			elif position.x > player.position.x:
				velocity.x = -JUMP_SPEED
			can_attack = false
			attack_cooldown.start()
		
	move_and_slide()

func _on_attack_cooldown_timeout():
	can_attack = true

func take_damage(damage):
	if taking_damage == false:
		health -= damage
		# play damage animation here
		if health <= 0:
			get_node("CollisionShape2D").queue_free()
			despawn.start()
		else:
			stun_time.start()
			taking_damage = true
			animated_sprite_2d.play("hurt")

func _on_stun_time_timeout():
	taking_damage = false
	animated_sprite_2d.play("default")

func _on_despawn_timeout():
	queue_free()
