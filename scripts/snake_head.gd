class_name Snake_Head extends SnakePart


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("food"):
		Signals.food_eaten.emit()
		area.call_deferred("queue_free")
	elif area.is_in_group("snake"):
		#collided with snake part
		Signals.collided_with_tail.emit()
