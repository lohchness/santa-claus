extends Node2D

@onready var missile: PackedScene = preload("res://obstacles/rocket/horizontal_rocket.tscn")
@onready var balloon: PackedScene = preload("res://obstacles/balloon/balloon.tscn")
@onready var jet: PackedScene = preload("res://characters/fighterjet/jet.tscn")

@onready var santa = $Santa
@onready var label = $Label

var t = 0
var score = 0

func _physics_process(delta: float) -> void:
	t += delta
	score = int(t * 10)
	
	label.text = str(score)
	
	santa.connect("dead", Callable(self,"end_game"))

func end_game():
	Globals.score = score
	get_tree().change_scene_to_file("res://ui/menu/end.tscn")

func _on_missile_timer_timeout() -> void:
	var m = missile.instantiate()
	add_child(m)
	m.global_position = Vector2(1300, randi_range(50, 600))



func _on_balloon_timer_timeout() -> void:
	var b = balloon.instantiate()
	add_child(b)
	b.global_position = Vector2(randi_range(100, 1100), 800)


func _on_jet_timer_timeout() -> void:
	var j = jet.instantiate()
	add_child(j)
	j.global_position = Vector2(-175, randi_range(20, 90))
