class_name Game extends Node2D

@onready var player: Player = $Player
@onready var enemy: Enemy = $Enemy

func _process(delta: float) -> void:
	enemy.update(delta, player.spaceship.get_global_position())
