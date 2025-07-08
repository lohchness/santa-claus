extends CharacterBody2D

@export var gifts: Array[Texture2D] = []

var speed
var jump_velocity

func _ready() -> void:
	$Sprite2D.texture = gifts.pick_random()

func _physics_process(delta: float) -> void:
	velocity += Vector2(0, 800) * delta
	move_and_slide()

func _on_present_body_entered(body: Node2D) -> void:
	if body.has_method("receive_damage"):
		body.receive_damage()
	queue_free()
