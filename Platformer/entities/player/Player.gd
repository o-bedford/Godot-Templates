extends KinematicBody2D
class_name Player

var DEFAULT_WALK_SPEED = 200
var DEFAULT_JUMP_IMPULSE = 200
var GRAVITY = 200

var velocity = Vector2.ZERO

func get_input_direction_x() -> float:
	return Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
