extends Node2D

@onready var missile: PackedScene = preload("res://obstacles/rocket/horizontal_rocket.tscn")
@onready var balloon: PackedScene = preload("res://obstacles/balloon/balloon.tscn")
@onready var jet: PackedScene = preload("res://characters/fighterjet/jet.tscn")

@onready var santa = $Santa
@onready var label = $Label

var t = 0
var score = 0

func _ready() -> void:
	santa.connect("dead", Callable(self,"end_game"))

func _physics_process(delta: float) -> void:
	t += delta
	score = int(t * 10)
	
	label.text = str(score)
	
	if Globals.speedup:
		Globals.speedmult = lerp(Globals.speedmult, Globals.maxspeedmult, .2 * delta)
		print(Globals.speedmult)


func end_game():
	Globals.score = score
	get_tree().change_scene_to_file("res://ui/menu/end.tscn")

func _on_missile_timer_timeout() -> void:
	var m = missile.instantiate()
	add_child(m)
	m.global_position = Vector2(1300, randi_range(50, 600))
	
	$MissileTimer.wait_time = randf_range(0.6, 1.6) / Globals.speedmult


func _on_balloon_timer_timeout() -> void:
	var b = balloon.instantiate()
	add_child(b)
	b.global_position = Vector2(randi_range(100, 1100), 800)
	
	$BalloonTimer.wait_time = randf_range(2, 8)


func _on_jet_timer_timeout() -> void:
	var j = jet.instantiate()
	add_child(j)
	j.global_position = Vector2(-175, randi_range(20, 90))
	
	if randi_range(0, 3) == 0:
		var j2 = jet.instantiate()
		add_child(j2)
		j2.global_position = Vector2(-175, randi_range(20, 90))
	
	$JetTimer.wait_time = randf_range(3, 6)


func _on_start_grace_period_timeout() -> void:
	$MissileTimer.start()

func _on_jet_grace_period_timeout() -> void:
	$JetTimer.start()

func _on_balloon_grace_period_timeout() -> void:
	$BalloonTimer.start()

func _on_speed_grace_period_timeout() -> void:
	Globals.speedup = true
