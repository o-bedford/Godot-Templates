extends PlayerState

func enter(_msg := {}) -> void:
	print("Walk")

func update(delta:float) -> void:
#	Move according to player input.
	player.velocity.x = player.get_input_direction_x() * player.movement_speed
	player.move_and_slide(player.velocity, Vector2.UP)
	
#	Fall transitions to air.
	if !player.is_on_floor():
		state_machine.transition_to("Air")
	
#	Can jump in this state
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Air", {do_jump = true})
	
#	Idle if no movement.
	if is_equal_approx(player.velocity.x, 0.0):
		state_machine.transition_to("Idle")
