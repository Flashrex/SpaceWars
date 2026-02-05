class_name Player extends CharacterBody2D

@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var weapon_component: WeaponComponent = $WeaponComponent

func _physics_process(delta: float) -> void:
	input_component.update()

	movement_component.accelerating = input_component.accelerating
	movement_component.target_dir = input_component.aim_vector
	movement_component.tick(delta)
	
	weapon_component.target_vector = input_component.aim_vector
