extends PlayerState

func enter(_msg := {}) -> void:
	print("Idle")

func update(delta:float) -> void:
	if !player.is_on_floor():
		state_machine.transition_to("Air")
	
	if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
		state_machine.transition_to("Walk")
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Air", {"do_jump" : true})
