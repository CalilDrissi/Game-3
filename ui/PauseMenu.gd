extends Control



func _on_Exit_pressed():
	get_tree().change_scene("res://ui/StartScreen.tscn")
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused

