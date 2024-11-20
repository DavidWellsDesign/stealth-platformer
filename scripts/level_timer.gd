extends Label

var timer : float = 0.0
var is_on : bool = false

@export var level:int

@onready var level_complete = %LevelComplete

func _ready():
	start()

func _process(delta : float):
	if is_on:
		timer += delta
		#time in seconds, with 3 decimal places
		self.text = String.num(timer, 2) 

func start():
	is_on = true

func stop():
	is_on = false
	level_complete.update_score(String.num(timer, 2))
	LevelProgress.best_time(level,timer)

func reset():
	timer = 0.0
