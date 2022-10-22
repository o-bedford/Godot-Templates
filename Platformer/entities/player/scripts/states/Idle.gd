extends PlayerState

func enter(_msg := {}) -> void:
	print("Idle")

func update(delta:float) -> void:
#	If player is falling, transition to air state.
	if !player.is_on_floor():
		state_machine.transition_to("Air")
	
#	Any horizontal movement keys pressed results in change to walk state.
	if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
		state_machine.transition_to("Walk")
	
#	Jump button moves to air state with a "do_jump" dictionary item.
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Air", {do_jump = true})
