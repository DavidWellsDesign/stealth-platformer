extends Node

var score = 0
var paused:bool = false
@onready var score_label = $ScoreLabel
@onready var player = %Player
@onready var respawn_timer = %RespawnTimer
@onready var level_complete = %LevelComplete

# Not used!
#func add_point():
	#score += 1
	#score_label.text = "You have " + str(score) + " coins"

#func _input(event):
	#if Input.is_action_just_pressed('Pause'):
		#if paused == false:
			#paused = true
			#get_tree().paused = true
			#level_complete.visible = true
		#else:
			#paused = false
			#get_tree().paused = false

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false

func _on_player_game_over():
	game_over()

func _on_respawn_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()

func _on_camera_game_over():
	game_over()
	
func _on_laser_game_over():
	game_over()

func game_over():
	print("You Died")
	AudioManager.play_hurt_sound()
	Engine.time_scale = 0.5
	player.caught = true
	player.get_node("CollisionShape2D").queue_free()
	player.get_node("Hurtbox").queue_free()
	respawn_timer.start()


func _on_searchlight_game_over():
	game_over()

func _on_searchlight_area_entered(area):
	game_over()
