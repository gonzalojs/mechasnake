class_name Gameplay extends Node2D

@export_category("References:")
@export var button_event : ButtonCaptureComponent
@export var head : Snake_Head
@export var bounds : Bounds
@export var spawner : Spawner

var move_dir : Vector2 = Vector2.RIGHT #Direccion inicial
var time_between_moves : float = 500.0
var time_since_last_move : float = 0.0
var speed : float = 1000.0
var snake_parts : Array[SnakePart] = []

func _ready() -> void:
	Signals.food_eaten.connect(_on_food_eaten)
	Signals.tail_added.connect(_on_tail_added)
	spawner.spawn_food()
	
	#Agregando la cabeza para que haya una pieza que seguir al inicio
	# snake_parts siempre tendra al menos la cabeza
	snake_parts.push_back(head)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		move_dir = Vector2.UP
	if Input.is_action_just_pressed("down"):
		move_dir = Vector2.DOWN
	if Input.is_action_just_pressed("left"):
		move_dir = Vector2.LEFT
	if Input.is_action_just_pressed("right"):
		move_dir = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	time_since_last_move += delta * speed
	if time_since_last_move >= time_between_moves:
		_uptdate_snake()
		time_since_last_move = 0
	

func _uptdate_snake():
	var new_pos : Vector2 = head.position + move_dir * Globals.grid_size
	new_pos = bounds.wrap_vector(new_pos)
	head.move_to(new_pos)
	
	for i in range(1, snake_parts.size(), 1):
		snake_parts[i].move_to(snake_parts[i-1].last_position)

func _on_food_eaten():
	spawner.call_deferred("spawn_food")
	spawner.call_deferred("spawn_tail", snake_parts[snake_parts.size() - 1].last_position)

func _on_tail_added(tail : Tail):
	snake_parts.push_back(tail)
