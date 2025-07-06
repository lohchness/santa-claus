extends Node2D

@onready var missile: PackedScene = preload("res://obstacles/rocket/horizontal_rocket.tscn")
@onready var balloon: PackedScene = preload("res://obstacles/balloon/balloon.tscn")

func _physics_process(delta: float) -> void:
	pass


func _on_missile_timer_timeout() -> void:
	var m = missile.instantiate()
	add_child(m)
	m.global_position = Vector2(1300, randi_range(50, 600))



func _on_balloon_timer_timeout() -> void:
	var b = balloon.instantiate()
	add_child(b)
	b.global_position = Vector2(randi_range(100, 1100), 800)
