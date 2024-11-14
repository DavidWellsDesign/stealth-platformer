extends Control

@onready var level_2 = $VBoxContainer/Level2
@onready var level_3 = $VBoxContainer/Level3

# Called when the node enters the scene tree for the first time.
func _ready():
	if LevelProgress.levelCompletion['Level1'] == 0:
		level_2.disabled = true
	if LevelProgress.levelCompletion['Level2'] == 0:
		level_3.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
