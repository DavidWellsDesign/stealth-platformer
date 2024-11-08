extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer
@onready var powerup_manager = %PowerupManager

signal powerup_collected(type)

func _on_body_entered(_body):
	powerup_manager.get_powerup()
	animation_player.play("pickup")
	powerup_collected.emit("test")
