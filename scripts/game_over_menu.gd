class_name GameOver extends CanvasLayer

@onready var score: Label = %ScoreLabel
@onready var high_score: Label = %HighScoreLabel
@onready var restart: Button = %RestartButton
@onready var quit: Button = %QuitButton


func set_score(puntaje : int):
	score.text = "Final Score: " + str(puntaje)

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene() #TODO:  actualizar los globales antes de restart


func _on_quit_button_pressed() -> void:
	get_tree().quit() # esto no funciona en web browser

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_ENTER_TREE:
			get_tree().paused = true
		NOTIFICATION_EXIT_TREE:
			get_tree().paused = false
