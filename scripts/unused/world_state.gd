extends Node2D
@onready var blue_walls = %BlueWalls

var world_state = 'blue'

func _input(event):
	if Input.is_action_just_pressed('jump'):
		if world_state == 'blue':
			blue_walls.collision_enabled = false
			blue_walls.visible = false
			world_state = 'red'
		elif world_state == 'red':
			blue_walls.collision_enabled = true
			blue_walls.visible = true
			world_state = 'blue'
		
