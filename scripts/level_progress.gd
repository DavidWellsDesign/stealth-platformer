extends Node

var config = ConfigFile.new()

var levelCompletion:Dictionary = {"Level1": 0, "Level2": 0, "Level3": 0, "Level4": 0, "Level5": 0, "Level6": 0, "LevelS": 0}

var completionTimes:Array = [0.0,0.0,0.0,0.0,0.0,0.0,0.0] #Dictionary won't work for some reason?

var unlock_all:bool = false

func _ready():
	var err = config.load("user://savegame.cfg")
	if err == OK:
		levelCompletion = config.get_value("Progress","Level")
		completionTimes = config.get_value("Progress","Time")
		
func level_clear(level,secret):
	if secret == true:
		levelCompletion[level] = 2
	else:
		levelCompletion[level] = 1
	config.set_value("Progress","Level",levelCompletion)
	config.save("user://savegame.cfg")
	print('saved!')

func best_time(level,timer):
	if completionTimes[level] > timer or completionTimes[level] == 0.0:
		completionTimes[level] = snapped(timer,0.01)
		config.set_value("Progress","Time",completionTimes)
		config.save("user://savegame.cfg")
