extends Bala

@onready var timer_death: Timer = $TimerDeath



func _on_timer_death_timeout() -> void:
	call_deferred("queue_free")
