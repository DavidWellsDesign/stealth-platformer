extends Node

@export var bg_music_player: AudioStreamPlayer
@onready var hurt = $Hurt

var current_track: String
var music_volume: int
var sfx_volume: int


func _ready():
	current_track = "Level 1"
	update_music_for_scene("Track10")

func update_music_for_scene(track):
	bg_music_player["parameters/switch_to_clip"] = track

func play_hurt_sound():
	hurt.play()
