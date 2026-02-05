class_name BasicGun extends BaseWeapon

@export var bullet_scene: PackedScene

@export var bullet_speed := 400.0

func fire(global_position: Vector2, direction: Vector2) -> Node2D:
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.velocity = direction * bullet_speed
	return bullet
