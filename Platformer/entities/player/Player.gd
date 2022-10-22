extends KinematicBody2D
class_name Player

#	Movement speed.
export var movement_speed:float

export var jump_height:float
export var jump_time_to_peak:float
export var jump_time_to_descent:float

#	Math that makes jumping easier to make feel good. Adjust exported jump vars to make jump how you want it.
onready var jump_velocity:float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity:float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity:float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

#	Velocity, used by most states
var velocity = Vector2.ZERO

#	Returns the input direction, 1.0 for moving right and -1.0 for moving left. Used by states.
func get_input_direction_x() -> float:
	return Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

#	If the player is going up, get_gravity() returns jump_gravity. If the player is going down, fall gravity.
func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
