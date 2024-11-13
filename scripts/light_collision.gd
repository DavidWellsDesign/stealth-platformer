extends RayCast2D

signal game_over
signal light_hit

func _physics_process(delta):
	queue_redraw()

func _draw():
	var line_end = target_position
	
	if is_colliding():
		
		line_end = to_local(get_collision_point())
		if get_collider().is_in_group('Player'):
			light_hit.emit(get_collider())
	
	draw_line(Vector2.ZERO, line_end, Color(0,1,0), 2.0)
