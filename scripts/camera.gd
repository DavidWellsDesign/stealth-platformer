extends Node2D

# Variables will have to be set for each instance manually
@export var max_angle_left: int
@export var max_angle_right: int
@export var rotation_speed: int

var current_direction = 1  # 1 for rotating right, -1 for rotating left

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Calculate new rotation
	var new_rotation = rotation_degrees + (rotation_speed * current_direction * delta)
	
	# Check boundaries and reverse direction if needed
	if new_rotation >= max_angle_right:
		new_rotation = max_angle_right
		current_direction = -1
	elif new_rotation <= max_angle_left:
		new_rotation = max_angle_left
		current_direction = 1
	
	# Apply the new rotation
	rotation_degrees = new_rotation
