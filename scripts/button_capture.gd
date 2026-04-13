class_name ButtonCaptureComponent extends Node


var _button_input : InputEvent

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("up"):
		_button_input = event
	if Input.is_action_pressed("down"):
		_button_input = event
	if Input.is_action_pressed("left"):
		_button_input = event
	if Input.is_action_pressed("right"):
		_button_input = event
