class_name InputComponent extends Node

var accelerating := false
var aim_vector := Vector2.ZERO

func update() -> void:
	accelerating = Input.is_action_pressed("accelerate")

	var mouse_pos = get_viewport().get_mouse_position()
	mouse_pos = get_viewport().get_canvas_transform().affine_inverse() * mouse_pos
	var mouse_dir = (mouse_pos - get_parent().global_position)
	
	var stick_dir = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")
	
	if stick_dir.length() > 0.1:
		aim_vector = stick_dir.normalized()
	else:
		aim_vector = mouse_dir.normalized()
