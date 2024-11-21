extends Control

@onready var level_1 = $VBoxContainer/Level1
@onready var level_2 = $VBoxContainer/Level2
@onready var level_3 = $VBoxContainer/Level3
@onready var level_4 = $VBoxContainer/Level4
@onready var level_5 = $VBoxContainer/Level5
@onready var level_6 = $VBoxContainer/Level6

@onready var level_1_time = $"VBoxContainer2/Level 1 time"
@onready var level_2_time = $"VBoxContainer2/Level 2 time"
@onready var level_3_time = $"VBoxContainer2/Level 3 time"
@onready var level_4_time = $"VBoxContainer2/Level 4 time"
@onready var level_5_time = $"VBoxContainer2/Level 5 time"
@onready var level_6_time = $"VBoxContainer2/Level 6 time"

@onready var level_1_clear = $"VBoxContainer3/Level 1 clear"
@onready var level_2_clear = $"VBoxContainer3/Level 2 clear"
@onready var level_3_clear = $"VBoxContainer3/Level 3 clear"
@onready var level_4_clear = $"VBoxContainer3/Level 4 clear"
@onready var level_5_clear = $"VBoxContainer3/Level 5 clear"
@onready var level_6_clear = $"VBoxContainer3/Level 6 clear"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	level_1.grab_focus()
	
	# ToDo: Update the below to use recursive statements so it's easier to add more levels
	
	# Disable locked levels
	if LevelProgress.unlock_all == false:
		if LevelProgress.levelCompletion['Level1'] == 0:
			level_2.disabled = true
		if LevelProgress.levelCompletion['Level2'] == 0:
			level_3.disabled = true
		if LevelProgress.levelCompletion['Level3'] == 0:
			level_4.disabled = true
		if LevelProgress.levelCompletion['Level4'] == 0:
			level_5.disabled = true
		if LevelProgress.levelCompletion['Level5'] == 0:
			level_6.disabled = true

	# Show clear and secret stats
	if LevelProgress.levelCompletion['Level1'] == 1:
		level_1_clear.text = "C: [X] S: [ ]"
	elif LevelProgress.levelCompletion['Level1'] == 2:
		level_1_clear.text = "C: [X] S: [X]"
		
	if LevelProgress.levelCompletion['Level2'] == 1:
		level_2_clear.text = "C: [X] S: [ ]"
	elif LevelProgress.levelCompletion['Level2'] == 2:
		level_2_clear.text = "C: [X] S: [X]"
		
	if LevelProgress.levelCompletion['Level3'] == 1:
		level_3_clear.text = "C: [X] S: [ ]"
	elif LevelProgress.levelCompletion['Level3'] == 2:
		level_3_clear.text = "C: [X] S: [X]"
		
	if LevelProgress.levelCompletion['Level4'] == 1:
		level_4_clear.text = "C: [X] S: [ ]"
	elif LevelProgress.levelCompletion['Level4'] == 2:
		level_4_clear.text = "C: [X] S: [X]"
		
	if LevelProgress.levelCompletion['Level5'] == 1:
		level_5_clear.text = "C: [X] S: [ ]"
	elif LevelProgress.levelCompletion['Level5'] == 2:
		level_5_clear.text = "C: [X] S: [X]"

	if LevelProgress.levelCompletion['Level6'] == 1:
		level_6_clear.text = "C: [X] S: [ ]"
	elif LevelProgress.levelCompletion['Level6'] == 2:
		level_6_clear.text = "C: [X] S: [X]"

	# Show completion times
	if LevelProgress.completionTimes[0] > 0.0:
		level_1_time.text = "T: ["+ str(LevelProgress.completionTimes[0])+"]"
	if LevelProgress.completionTimes[1] > 0.0:
		level_2_time.text = "T: ["+ str(LevelProgress.completionTimes[1])+"]"
	if LevelProgress.completionTimes[2] > 0.0:
		level_3_time.text = "T: ["+ str(LevelProgress.completionTimes[2])+"]"
	if LevelProgress.completionTimes[3] > 0.0:
		level_4_time.text = "T: ["+ str(LevelProgress.completionTimes[3])+"]"
	if LevelProgress.completionTimes[4] > 0.0:
		level_5_time.text = "T: ["+ str(LevelProgress.completionTimes[4])+"]"
	if LevelProgress.completionTimes[5] > 0.0:
		level_6_time.text = "T: ["+ str(LevelProgress.completionTimes[5])+"]"


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	AudioManager.update_music_for_scene("Track2")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
	AudioManager.update_music_for_scene("Track3")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")
	AudioManager.update_music_for_scene("Track4")


func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
	AudioManager.update_music_for_scene("Track2")


func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")


func _on_level_6_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_6.tscn")
