extends Control

@onready var score = $Panel/Score
@onready var complete = $Panel/Complete
@onready var game_manager = %GameManager

var paused:bool = false
var cleared:bool = false

func update_score(time):
	complete.text="Level Complete!"
	score.text = 'Completion Time: '+ String(time)

func _on_next_level_pressed():
	game_manager.unpause()
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	game_manager.unpause()
	AudioManager.update_music_for_scene("Track10")
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _input(event):
	if Input.is_action_just_pressed('Pause') and cleared == false:
		if paused == false:
			complete.text="Paused"
			score.text=""
			paused = true
			visible = true
			game_manager.pause()
		else:
			paused = false
			visible = false
			game_manager.unpause()
