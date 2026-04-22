extends CharacterBody2D

@export var movement_speed : float = 20.0

@onready var snake = get_tree().get_first_node_in_group("snake")

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(snake.global_position)
	velocity = direction * movement_speed
	move_and_slide()
