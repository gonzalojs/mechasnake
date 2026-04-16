class_name Tail extends SnakePart

@export_category("Tail Textures")
@export var textures : Array[Texture]

@onready var sprite: Sprite2D = $Sprite

func _ready() -> void:
	sprite.texture = textures.pick_random()
