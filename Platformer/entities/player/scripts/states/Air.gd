extends PlayerState

func enter(_msg := {}) -> void:
	if _msg.has("do_jump"):
		player.velocity.y = -player.DEFAULT_JUMP_IMPULSE
		print("Jump")
	else:
		print("Air")

func update(delta:float) -> void:
	player.velocity.x = player.get_input_direction_x() * player.DEFAULT_WALK_SPEED
	player.velocity.y += player.GRAVITY * delta
	player.move_and_slide(player.velocity, Vector2.UP)
