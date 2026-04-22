extends CharacterBody2D

@export var movement_speed : float = 20.0

var snakes : Array = []
var bullet_scene = preload("res://gameplay/balas/bala_1.tscn")

@onready var snake = get_tree().get_first_node_in_group("head")
@onready var shoot_timer: Timer = $ShootTimer
@onready var spawn_point: Marker2D = $SpawnPoint



func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(snake.global_position)
	velocity = direction * movement_speed
	move_and_slide()


func shoot():
	call_deferred("spawn_bullet")

func spawn_bullet():
	if not snakes.is_empty():
		var bullet = bullet_scene.instantiate()
		if not spawn_point or not is_instance_valid(spawn_point):
			return

		bullet.global_position = spawn_point.global_position

		var target = snakes.pick_random().global_position
		var dir_to_target = bullet.global_position.direction_to(target)
	
		bullet.set_direction(dir_to_target)
	
		get_tree().root.add_child(bullet)

#estas signals detectan cabeza y cuerpo. Tienen que detectar solo cuerpo
#la cabeza debe ser detectada siempre por el enemigo, el cuerpo solo cuando est
func _on_detection_area_area_entered(area: Area2D) -> void:
	snakes.append(area)


func _on_detection_area_area_exited(area: Area2D) -> void:
	snakes.erase(area)


func _on_shoot_timer_timeout() -> void:
	if not snakes.is_empty():
		shoot()
