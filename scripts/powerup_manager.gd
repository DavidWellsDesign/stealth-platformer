extends Node

@onready var player = %Player

var powerup = false

func get_powerup():
	if powerup == false:
		powerup = true
		print("POWERUP")
		player.apply_powerup()


func _on_powerup_powerup_collected(type):
	if type == "test":
		print("SIGNAL TEST")
