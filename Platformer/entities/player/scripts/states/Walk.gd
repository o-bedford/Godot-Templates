extends PlayerState

func enter(_msg := {}) -> void:
	print("Walk")

func update(delta:float) -> void:
	player.velocity.x = player.get_input_direction_x() * player.DEFAULT_WALK_SPEED
	player.move_and_slide(player.velocity, Vector2.UP)
	
	if is_equal_approx(player.velocity.x, 0):
		state_machine.transition_to("Idle")
	
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Air", {"do_jump" : true})
