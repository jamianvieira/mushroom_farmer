extends Node

@export var initial_state : EnemyState

var current_state : EnemyState
var states : Dictionary = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is EnemyState:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)
	
	if initial_state:
		current_state = initial_state
		current_state.enter()

func _process(delta):
	if current_state:
		current_state.process_state(delta)
	
func _physics_process(delta):
	if current_state:
		current_state.physics_process_state(delta)
		
func on_child_transition(state: EnemyState, new_state_name: String):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	# Clean up the previous state
	if current_state:
		current_state.exit()
	
	# Intialize the new state
	new_state.enter()
	current_state = new_state
