extends RayCast2D

@onready var player = %Player
@onready var game_manager = %GameManager

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
			#game_over.emit()
			game_manager.game_over()
	
	draw_line(Vector2.ZERO, line_end, Color(1,1,1), 2.0)
