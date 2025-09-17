extends Node2D

@export
var starting_state: State

var current_state: State

func init(parent: Player) -> void: 
	for child in get_children():
		child.parent = parent
		
	change_state(starting_state)
	
func change_state(new_state: State) -> void: 
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()
	
