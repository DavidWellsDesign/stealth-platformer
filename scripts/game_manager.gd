extends Node

var score = 0
@onready var score_label = $ScoreLabel
@onready var player = %Player
@onready var respawn_timer = %RespawnTimer

func add_point():
	score += 1
	score_label.text = "You have " + str(score) + " coins"

func _on_player_game_over():
	print("You Died")
	Engine.time_scale = 0.5
	player.get_node("CollisionShape2D").queue_free()
	respawn_timer.start()

func _on_respawn_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
