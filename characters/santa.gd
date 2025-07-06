extends CharacterBody2D

@export var reindeer_array: Array[CollisionShape2D] = []

# VERY BAD IDEA! 
var mouse_points: Array[float] = []
var delay_ms: float = .08
const FRAMES: int = 60

func _ready() -> void:
	mouse_points = []

func _physics_process(delta: float) -> void:
	var mouseY = get_global_mouse_position().y
	mouse_points.append(mouseY)
	
	if len(mouse_points) < int(FRAMES*delay_ms):
		return
	
	var delayed_position = mouse_points.pop_front()
	
	reindeer_array[0].global_position.y = lerp(reindeer_array[0].global_position.y, delayed_position, .3)
	for i in range(1, len(reindeer_array)):
		#reindeer_array[i].position.y = reindeer_array[i-1].position_history.pop_front()
		reindeer_array[i].global_position.y = lerp(reindeer_array[i].global_position.y, reindeer_array[i-1].position_history.pop_front(), .3)
	
	
	#reindeer_array[0].position.y = lerp(reindeer_array[0].position.y, mouseY, .2)
	#for i in range(1, len(reindeer_array)):
		#reindeer_array[i].position.y = lerp(reindeer_array[i].position.y, reindeer_array[i-1].position.y, .4)

func add_mouse_y(p: float):
	mouse_points.append(p)

func pop_mouse_y():
	return mouse_points.pop_front()

func receive_damage():
	reindeer_array.pop_front().queue_free()
