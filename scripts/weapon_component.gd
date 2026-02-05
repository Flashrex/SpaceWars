class_name WeaponComponent extends Node

@export var weapon: BaseWeapon
@export var target_vector := Vector2.ZERO

var cooldown_timer := 0.0

func _physics_process(delta: float) -> void:
	if weapon == null:
		return
		
	cooldown_timer -= delta
	
	if cooldown_timer <= 0.0 and target_vector.length() > 0:
		var bullet = weapon.fire(get_parent().global_position, target_vector)
		if bullet != null:
			get_tree().current_scene.add_child(bullet)
		
		cooldown_timer = weapon.cooldown
