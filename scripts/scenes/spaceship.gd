class_name Spaceship extends CharacterBody2D

@export var shipData : BaseShip

@onready var movement_component: MovementComponent = %MovementComponent
@onready var weapon_component: WeaponComponent = %WeaponComponent
@onready var muzzles: Array[Marker2D] = [
	$Sprite2D/MuzzleLeft,
	$Sprite2D/MuzzleRight
]

func _ready() -> void:
	movement_component.setup(self, shipData)
	weapon_component.setup(self, shipData.weapon, muzzles)
	
func update(delta: float, target_dir: Vector2, is_accelerating: bool, should_fire: bool) -> void:
	var facing_dir = Vector2.UP.rotated(rotation)
	
	movement_component.update(delta, target_dir, is_accelerating)
	weapon_component.update(delta, facing_dir, should_fire)
