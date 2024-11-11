extends Area2D

@onready var player = %Player

var interactable = false
var player_hidden = false

signal flipSwitch

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack") and interactable == true:
		flipSwitch.emit()

func _on_body_entered(body):
		if body == player:
			interactable = true

func _on_body_exited(body):
	if body == player and player_hidden == false:
			interactable = false
