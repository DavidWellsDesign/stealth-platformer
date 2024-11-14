extends Area2D

@onready var player = %Player
@onready var level_complete = %LevelComplete

@export var level:String
@export var secret_exit:bool = false

var interactable = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack") and interactable == true:
		LevelProgress.level_clear(level)
		print('Level complete!')
		level_complete.visible = true
		player.player_hidden = true

func _on_body_entered(body):
	if body == player:
		interactable = true

func _on_body_exited(body):
	if body == player:
			interactable = false
