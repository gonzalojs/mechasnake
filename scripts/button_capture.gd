class_name ButtonCaptureComponent extends Node

var move_dir : Vector2 = Vector2.RIGHT #Direccion inicial

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("up"):
		move_dir = Vector2.UP
	if Input.is_action_pressed("down"):
		move_dir = Vector2.DOWN
	if Input.is_action_pressed("left"):
		move_dir = Vector2.LEFT
	if Input.is_action_pressed("right"):
		move_dir = Vector2.RIGHT
