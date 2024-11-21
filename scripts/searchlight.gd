extends Area2D

signal game_over

func _on_area_entered(area):
	game_over.emit()
	
