extends CollisionShape2D

var position_history: Array[float] = []

func _physics_process(delta: float) -> void:
	position_history.append(global_position.y)
