extends Node2D

@onready var trees = $TreesLong

func _physics_process(delta: float) -> void:
	if Globals.speedup:
		trees.autoscroll = Vector2(-500 * Globals.speedmult, 0)
