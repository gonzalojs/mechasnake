extends CharacterBody2D

@export var movement_speed : float = 20.0

@onready var snake = get_tree().get_first_node_in_group("snake")

var snakes : Array = []

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(snake.global_position)
	velocity = direction * movement_speed
	move_and_slide()


func _on_detection_area_area_entered(area: Area2D) -> void:
	snakes.append(area.name)
	print(snakes)


func _on_detection_area_area_exited(area: Area2D) -> void:
	snakes.erase(area.name)
