extends Control

func _ready() -> void:
	$Label2.text = "Score: " + str(Globals.score)

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://ui/menu/menu.tscn")
