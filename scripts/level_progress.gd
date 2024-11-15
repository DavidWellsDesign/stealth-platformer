extends Node

var levelCompletion:Dictionary = {"Level1": 0, "Level2": 0, "Level3": 0}

func level_clear(level,secret):
	if secret == true:
		levelCompletion[level] = 2
	else:
		levelCompletion[level] = 1
