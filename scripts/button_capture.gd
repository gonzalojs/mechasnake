class_name ButtonCaptureComponent extends Node

var move_dir : Vector2 = Vector2.RIGHT #Direccion inicial

func _unhandled_input(event: InputEvent) -> void:
	#No volver por el mismo camino para no chocar contra todo el cuerpo
	if Input.is_action_pressed("up"):
		if move_dir == Vector2.DOWN:
			move_dir = Vector2.DOWN
		else:
			move_dir = Vector2.UP
	if Input.is_action_pressed("down"):
		if move_dir == Vector2.UP:
			move_dir = Vector2.UP
		else:
			move_dir = Vector2.DOWN
	if Input.is_action_pressed("left"):
		if move_dir == Vector2.RIGHT:
			move_dir = Vector2.RIGHT
		else:
			move_dir = Vector2.LEFT
	if Input.is_action_pressed("right"):
		if move_dir == Vector2.LEFT:
			move_dir = Vector2.LEFT
		else:
			move_dir = Vector2.RIGHT
