extends Control


func _on_next_level_pressed():
	pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
