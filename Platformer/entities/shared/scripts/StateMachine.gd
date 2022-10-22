extends Node
class_name StateMachine

# Emitted when transitioning to new state
signal transitioned(state_name)

# Path to initial active state. (ex: player starts idle)
export var initial_state := NodePath()

# Current active state. Starts as initial state of course
onready var state:State = get_node(initial_state)

func _ready() -> void:
	yield(owner, "ready")
	# Sets 'state_machine' in State class to the machine
	for child in get_children():
		child.state_machine = self
	state.enter()

# Delegates calls to the state
func _unhandled_input(event:InputEvent) -> void:
	state.handle_input(event)

func _process(delta:float) -> void:
	state.update(delta)

func _physics_process(delta:float) -> void:
	state.physics_update(delta)

func transition_to(target_state_name:String, msg:Dictionary = {}) -> void:
	# Safety check
	if not has_node(target_state_name):
		return
	# Exit and switch
	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("transitioned", state.name)
