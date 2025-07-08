extends Area2D

const SPEED = 200

func _physics_process(delta: float) -> void:
	position += Vector2(-100, -SPEED) * delta



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("receive_damage"):
		body.receive_damage()
	queue_free()
