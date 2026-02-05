class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var model: Node2D

@export var max_speed := 200.0
@export var acceleration := 800.0 		# pixel/sec²
@export var friction := 600.0 			# pixel/sec²

@export var rotation_speed := 20

var accelerating := false
var target_dir := Vector2.ZERO

var velocity := Vector2.ZERO

func tick(delta: float) -> void:
	if body == null or model == null:
		return
		
	# update velocity and direction
	if target_dir.length() > 0:
		var target_angle = target_dir.angle() + PI/2
		var delta_angle = wrapf(target_angle - model.rotation, -PI, PI)
		model.rotation += clamp(delta_angle, -rotation_speed * delta, rotation_speed * delta)
	
	if accelerating:
		velocity = velocity.move_toward(target_dir * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	body.velocity = velocity
	body.move_and_slide()

	
