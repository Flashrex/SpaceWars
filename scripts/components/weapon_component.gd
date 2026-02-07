class_name WeaponComponent extends Node

var weapon: BaseWeapon
var muzzles: Array[Marker2D]

var owner_node: Node2D
var cooldown := 0.0

func setup(_owner: Node2D, _weapon: BaseWeapon, _muzzles: Array[Marker2D]) -> void:
	owner_node = _owner
	weapon = _weapon
	muzzles = _muzzles
	
func update(delta: float, dir: Vector2, should_fire: bool) -> void:
	cooldown = max(cooldown - delta, 0.0)
	
	if should_fire and cooldown <= 0.0 and dir != Vector2.ZERO:
		shoot(dir)
		cooldown = weapon.fire_rate
		
func shoot(direction: Vector2) -> void:
	for muzzle in muzzles:
		var bullet = weapon.bullet_scene.instantiate()
		bullet.global_position = muzzle.global_position
		bullet.velocity = direction * weapon.bullet_speed + owner_node.velocity
		get_tree().current_scene.add_child(bullet)
