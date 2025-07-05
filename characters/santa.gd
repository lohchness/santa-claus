extends CharacterBody2D

@export var reindeer_array: Array[CollisionShape2D] = []

var reindeer_delay_ms: int = 250


func _physics_process(delta: float) -> void:
	var mouseY = get_global_mouse_position().y
	
	for i in reindeer_array:
		i.position.y = mouseY
