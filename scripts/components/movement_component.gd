class_name MovementComponent extends Node

var body: CharacterBody2D
var stats: BaseShip

var rotation_speed := 20.0
var velocity := Vector2.ZERO

func setup(_body: CharacterBody2D, _stats: BaseShip) -> void:
	body = _body
	stats = _stats

func update(delta: float, target_dir: Vector2, is_accelerating: bool) -> void:
	if body == null or stats == null:
		return
		
	if target_dir.length() > 0:
		var target_angle = target_dir.angle() + PI/2
		var delta_angle = wrapf(target_angle - body.rotation, -PI, PI)
		body.rotation += clamp(delta_angle, -rotation_speed * delta, rotation_speed * delta)
	
	if is_accelerating:
		velocity = velocity.move_toward(target_dir * stats.max_speed, stats.acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, stats.friction * delta)
		
	body.velocity = velocity
	body.move_and_slide()

	
