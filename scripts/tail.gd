class_name Tail extends SnakePart

@export_category("Tail Textures")
@export var textures : Array[Texture]

@onready var sprite: Sprite2D = $Sprite


func _ready() -> void:
	sprite.texture = textures.pick_random()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("food"):
		Signals.food_eaten.emit()
		area.call_deferred("queue_free")
