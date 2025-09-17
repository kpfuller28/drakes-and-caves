class_name	State
extends Node

@export
var animation_name: String

@export
var move_speed: float = 600

var parent: Player

func enter() -> void:
	parent.animations.play(animation_name)
	
func exit() -> void:
	pass
	
	
