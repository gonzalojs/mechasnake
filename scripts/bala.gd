class_name Bala extends Area2D

var speed : float = 600.0
var direction : Vector2 = Vector2.ZERO

func set_direction(dir):
	direction = dir
	#rotate bullet to face direction of travel
	rotation = dir.angle()

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
