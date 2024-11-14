extends Node

var levelCompletion:Dictionary = {"Level1": 0, "Level2": 0, "Level3": 0}

func level_clear(level):
	levelCompletion[level] = 1
	print(levelCompletion)
