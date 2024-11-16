extends Node2D

var on:bool = false
@onready var mid = $"../TileMaps/Mid"
@onready var dark = $"../TileMaps/Dark"

func _ready():
	mid.enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('switch'):
		print(on)
		if on == false:
			mid.enabled = true
			dark.enabled = false
			on = true
		else:
			mid.enabled = false
			dark.enabled = true
			on = false
