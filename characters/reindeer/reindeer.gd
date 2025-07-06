extends CollisionShape2D

var position_history: Array[float] = []

func _ready() -> void:
	if randi_range(0, 1):
		$AnimatedSprite2D.frame = 6

func _physics_process(delta: float) -> void:
	position_history.append(global_position.y)
