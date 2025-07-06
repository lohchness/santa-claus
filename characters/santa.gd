extends CharacterBody2D

@export var reindeer_array: Array[CollisionShape2D] = []
@onready var dead_reindeer: PackedScene = preload("res://characters/dead_reindeer.tscn")
@onready var explosion: PackedScene = preload("res://explosion/explosion.tscn")

# VERY BAD IDEA! 
var mouse_points: Array[float] = []
var delay_ms: float = .08
const FRAMES: int = 60

func _ready() -> void:
	mouse_points = []
	

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * 1000
	velocity.y *= 1.5
	move_and_slide()
	
	#var mouseY = get_global_mouse_position().y
	var mouseY = global_position.y
	mouse_points.append(mouseY)
	
	if len(mouse_points) < int(FRAMES*delay_ms):
		return
	
	var delayed_position = mouse_points.pop_front()
	
	reindeer_array[0].global_position.y = global_position.y
	#reindeer_array[0].global_position.y = lerp(reindeer_array[0].global_position.y, delayed_position, .6)
	for i in range(1, len(reindeer_array)):
		reindeer_array[i].global_position.y = lerp(
			reindeer_array[i].global_position.y, 
			reindeer_array[i-1].position_history.pop_front(), 
			.3
		)
	
	queue_redraw()



func _draw() -> void:
	for i in range(1, len(reindeer_array)):
		draw_line(
				reindeer_array[i-1].position,
				reindeer_array[i].position,
				Color.OLIVE_DRAB,
				5
			)

func receive_damage():
	var r = reindeer_array.pop_front()
	
	var d = dead_reindeer.instantiate()
	d.scale = Vector2(.5, .5)
	get_tree().root.add_child(d)
	d.global_position = r.global_position
	
	var e = explosion.instantiate()
	get_tree().root.add_child(e)
	e.global_position = r.global_position
	
	r.queue_free()
