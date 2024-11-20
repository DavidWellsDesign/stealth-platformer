extends Node

var levelCompletion:Dictionary = {"Level1": 0, "Level2": 0, "Level3": 0}

var completionTimes:Array = [0.0,0.0,0.0] #Dictionary won't work for some reason?

func level_clear(level,secret):
	if secret == true:
		levelCompletion[level] = 2
	else:
		levelCompletion[level] = 1

func best_time(level,timer):
	if completionTimes[level] > timer or completionTimes[level] == 0.0:
		completionTimes[level] = timer
