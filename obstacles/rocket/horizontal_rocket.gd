extends CharacterBody2D

var speed
var jump_velocity

func _ready() -> void:
	speed = randi_range(-500, -800)
	jump_velocity = randi_range(-400, -700)
	velocity.y = jump_velocity

func _physics_process(delta: float) -> void:
	velocity.x = speed * Globals.speedmult
	velocity += Vector2(0, 700) * delta * Globals.speedmult
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("receive_damage"):
		body.receive_damage()
	queue_free()
