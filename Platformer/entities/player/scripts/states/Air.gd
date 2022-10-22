extends PlayerState

func enter(_msg := {}) -> void:
#	If do_jump is in the dictionary on transition, jump.
	if _msg.has("do_jump"):
		player.velocity.y = player.jump_velocity
		print("Jump")
	else:
		print("Air")

func update(delta:float) -> void:
#	Movement is still allowed midair. Applies gravity too
	player.velocity.x = player.get_input_direction_x() * player.movement_speed
	player.velocity.y += player.get_gravity() * delta
	
#	If horizontal movement is roughly around zero, move to idle state. If not then walk.
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Walk")
	player.move_and_slide(player.velocity, Vector2.UP)
