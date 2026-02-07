class_name Enemy extends Node2D

@onready var spaceship: Spaceship = $Spaceship

var max_distance := 300.0

func update(delta: float, target: Vector2) -> void:
	var distance = spaceship.global_position.distance_to(target)
	var target_pos = (target - spaceship.global_position).normalized()
	var is_accelerating = false
	
	if distance > max_distance:
		is_accelerating = true

	spaceship.update(delta, target_pos, is_accelerating, true)
