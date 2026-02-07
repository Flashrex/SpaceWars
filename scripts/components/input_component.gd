class_name InputComponent extends Node

var accelerating := false
var stick_dir := Vector2.ZERO

func update() -> void:
	accelerating = Input.is_action_pressed("accelerate")
	stick_dir = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")
