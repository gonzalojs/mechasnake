class_name Spawner extends Node2D

#signals
#export var
@export_category("References")
@export var bounds : Bounds
@export var manzana : PackedScene
# instantiating packed scenes
var manzana_scene : PackedScene = preload("res://items/apple.tscn")
var tail_scene : PackedScene = preload("res://snake/tail.tscn")


func spawn_food():
	# 1 where to spawn it (position)
	var spawn_point : Vector2 = Vector2.ZERO
	spawn_point.x = randf_range(bounds.x_min + Globals.grid_size, bounds.x_max - Globals.grid_size)
	spawn_point.y = randf_range(bounds.y_min + Globals.grid_size, bounds.y_max - Globals.grid_size)
	
	spawn_point.x = floorf(spawn_point.x / Globals.grid_size) * Globals.grid_size
	spawn_point.y = floorf(spawn_point.y / Globals.grid_size) * Globals.grid_size
	
	# 2 what we're spawning (initiating)
	var food = manzana.instantiate()
	food.position = spawn_point
	# 3 where we're putting it (parenting)
	get_parent().add_child(food)

func spawn_tail(pos : Vector2):
	var tail : Tail = tail_scene.instantiate() as Tail
	tail.position = pos
	get_parent().add_child(tail)
	Signals.tail_added.emit(tail)
