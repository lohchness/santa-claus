extends CharacterBody2D

func _on_timer_timeout() -> void:
	queue_free()

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	velocity.y = JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	rotate(8 * delta)
	
	velocity += Vector2(0, 4000) * delta
	velocity.x = move_toward(velocity.x, -400, SPEED)

	move_and_slide()
