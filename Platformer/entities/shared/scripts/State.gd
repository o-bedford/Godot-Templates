extends Node
class_name State

# Set by the state machine
var state_machine = null

# Recieves events from _unhandled_input() in StateMachine
func handle_input(_event: InputEvent) -> void:
	pass

# Basically _process()
func update(_delta: float) -> void:
	pass

# Basically _physics_process()
func physics_update(_delta: float) -> void:
	pass

# Called by state machine when state changed. msg param is info for the state to initialize itself
func enter(_msg := {}) -> void:
	pass

# Called by state machine before changing state. Cleans up stuff
func exit() -> void:
	pass
