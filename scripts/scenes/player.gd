class_name Player extends Node2D

@onready var input_component: InputComponent = %InputComponent
@onready var spaceship: Spaceship = $Spaceship

@onready var camera: Camera2D = $Spaceship/Camera2D

func _physics_process(delta: float) -> void:
	input_component.update()
	
	var aim_dir = calculateAimVector()
	spaceship.update(delta, aim_dir, input_component.accelerating, true)

func calculateAimVector() -> Vector2:
	if camera == null: 
		return Vector2.ZERO
	
	var aim_vector: Vector2
	var mouse_pos = camera.get_global_mouse_position()
	
	if input_component.stick_dir.length() > 0.1:
		aim_vector = input_component.stick_dir.normalized()
	else:
		aim_vector = (mouse_pos - spaceship.global_position).normalized()
		
	return aim_vector
