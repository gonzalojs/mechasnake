class_name Snake_Head extends SnakePart


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("food"):
		area.call_deferred("queue_free")
