extends Area2D

const SPEED = 1500

func _physics_process(delta: float) -> void:
	position += Vector2(-SPEED, 0) * delta


func _on_body_entered(body: Node2D) -> void:
	print("hello")
	if body.has_method("receive_damage"):
		body.receive_damage()
	queue_free()
