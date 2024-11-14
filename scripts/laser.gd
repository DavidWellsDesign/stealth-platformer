extends RayCast2D

@onready var player = %Player

signal game_over

func _ready():
	enabled = true  # Enable raycasting

func _physics_process(delta):
	queue_redraw()
	
func _draw():
	var line_end = target_position
	
	if is_colliding():
		line_end = to_local(get_collision_point())
		if get_collider() == player:
			print('laser hit player')
			game_over.emit()
	
	draw_line(Vector2.ZERO, line_end, Color(0,1,0), 2.0)
