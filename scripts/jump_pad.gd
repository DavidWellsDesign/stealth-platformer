extends Area2D

@onready var player = %Player
@onready var sprite_2d = $Sprite2D

@export var bounce_velocity = -400


func _on_body_entered(body):
	if body == player and !sprite_2d.is_playing():
		sprite_2d.play("active")
		body.velocity.y = bounce_velocity
