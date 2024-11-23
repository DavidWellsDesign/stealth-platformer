extends Area2D

signal game_over

@onready var game_manager = %GameManager

func _on_area_entered(area):
	game_over.emit()
	print("Spotted!")
	game_manager.game_over()
