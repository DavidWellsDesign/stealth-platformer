extends Area2D

@onready var player = %Player
@onready var animated_sprite_2d = $AnimatedSprite2D

var interactable = false
var player_hidden = false

signal hidePlayer
signal revealPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack") and interactable == true:
		animated_sprite_2d.play("open")
		if player_hidden == false:
			hidePlayer.emit()
			player_hidden = true
		else:
			revealPlayer.emit()
			player_hidden = false

func _on_body_entered(body):
		if body == player:
			interactable = true

func _on_body_exited(body):
	if body == player and player_hidden == false:
			interactable = false
