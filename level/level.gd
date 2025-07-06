extends Node2D

@onready var missile: PackedScene = preload("res://obstacles/rocket/horizontal_rocket.tscn")

func _physics_process(delta: float) -> void:
	pass


func _on_missile_timer_timeout() -> void:
	var m = missile.instantiate()
	add_child(m)
	m.global_position = Vector2(1300, randi_range(50, 600))
