extends CharacterBody2D

@export var reindeer_array: Array[CollisionShape2D] = []

# VERY BAD IDEA! 
var mouse_points: Array[float] = []
var delay_ms: float = .25
const FRAMES: int = 60

func _ready() -> void:
	mouse_points = []

func _physics_process(delta: float) -> void:
	var mouseY = get_global_mouse_position().y
	add_mouse_y(mouseY)
	
	if len(mouse_points) < 15:
		return
	
	var delayed_position = pop_mouse_y()
	
	#for i in reindeer_array:
		#i.position.y = delayed_position
	reindeer_array[0].position.y = lerp(reindeer_array[0].position.y, mouseY, .1)
	for i in range(1, len(reindeer_array)):
		reindeer_array[i].position.y = lerp(reindeer_array[i].position.y, reindeer_array[i-1].position.y, .1)

func add_mouse_y(p: float):
	mouse_points.append(p)

func pop_mouse_y():
	return mouse_points.pop_front()
