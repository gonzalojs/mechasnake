extends CanvasLayer

const GAMEPLAY_SCENE : PackedScene = preload("res://gameplay.tscn")

@onready var title: Label = %Title
@onready var start: Button = %Start
@onready var options: Button = %Options
@onready var quit: Button = %Quit




func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(GAMEPLAY_SCENE)


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
