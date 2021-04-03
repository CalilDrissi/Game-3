extends Control

func _ready():
	Global.setup()
	
func _on_Button_pressed():
#	get_tree().change_scene("res://levels/Level"+"1"+ ".tscn")
	Global.new_game()


func _on_Quit_pressed():
	 get_tree().quit()


func _on_Continue_pressed():
	 get_tree().change_scene("res://ui/LevelSelectScreen.tscn")
