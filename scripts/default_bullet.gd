class_name defaultBullet extends Area2D

@export var speed := 400.0
var velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += velocity * delta
	if velocity.length() > 0:
		rotation = velocity.angle() + PI/2
