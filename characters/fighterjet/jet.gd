extends Sprite2D

var speed = 0

var present = preload("res://characters/fighterjet/present/present.tscn")

func _ready() -> void:
	speed = randi_range(300, 500) * Globals.speedmult * 1.1
	
	var time = 1150 / speed
	$PresentTimer.wait_time = randf_range(0.5, time - 0.5)
	$PresentTimer.start()

func _physics_process(delta: float) -> void:
	position += Vector2(speed, 0) * delta


func _on_present_timer_timeout() -> void:
	var p = present.instantiate()
	get_tree().root.add_child(p)
	p.global_position = global_position + Vector2(70, 0)
