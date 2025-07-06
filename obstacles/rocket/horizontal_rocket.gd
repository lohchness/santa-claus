extends Area2D

const SPEED = 500

func _physics_process(delta: float) -> void:
	position += Vector2(-SPEED, 0) * delta
