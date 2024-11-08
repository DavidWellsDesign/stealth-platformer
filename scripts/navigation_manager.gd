extends Node

const scene_level2 = preload("res://scenes/levels/game.tscn")
const scene_level1 = preload("res://scenes/levels/level1.tscn")
const scene_entrance = preload("res://scenes/levels/entrance.tscn")
const scene_level3 = preload("res://scenes/levels/level3.tscn")

# The below dictionary stores data of every room, what side doors it contains
# and the chance of it spawning.
# When running go to level, a random room should be selected with a valid entrance
# For example I leave one room via the right door, a random room with "left" should be chosen
# The chance should be the probability of that room appearing.

# To give further variety, each room should have variants which I can store in the scenes

var room_list: Dictionary = {
	"lobby": {"scene": scene_entrance, "doors": ["right", "left"], "chance": 1},
	"level_1": {"scene": scene_level1, "doors": ["right", "left"], "chance": 1},
	"level_2": {"scene": scene_level2, "doors": ["right", "left", "top"], "chance": 1},
	"level_3": {"scene": scene_level3, "doors": ["left", "bottom"], "chance": 1}
}

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"lobby":
			scene_to_load = scene_entrance
		"level_1":
			scene_to_load = scene_level1
		"level_2":
			scene_to_load = scene_level2
		"level_3":
			scene_to_load = scene_level3
	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)

func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
