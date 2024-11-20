extends Control

var cheat_code = ''

@onready var start = $VBoxContainer/Start

func _ready():
	start.grab_focus()

func _on_start_pressed():
	if cheat_code == 'active' and Input.is_action_pressed('A'):
		LevelProgress.unlock_all = true
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")


func _on_settings_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()


func _input(event):
	if event.is_action_pressed("ui_up"):
		cheat_code = 'up'
	elif event.is_action_pressed("ui_down") and cheat_code == 'up':
		cheat_code = 'down'
	elif event.is_action_pressed("ui_left") and cheat_code == 'down':
		cheat_code = 'left'
	elif event.is_action_pressed("ui_right") and cheat_code == 'left':
		cheat_code = 'active'
		print(cheat_code)
