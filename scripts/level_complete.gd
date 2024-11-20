extends Control

@onready var score = $Panel/Score

func update_score(time):
	score.text = 'Completion Time: '+ String(time) +'
	Test'

func _on_next_level_pressed():
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
