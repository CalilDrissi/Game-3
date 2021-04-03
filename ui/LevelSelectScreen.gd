extends Control


	

var start_screen = "res://ui/StartScreen.tscn"

func _on_BackButton_pressed():
	 get_tree().change_scene(start_screen)

func _ready():
	Global.setup()
	var lev = $Levels.get_child_count()
	var lvi = lev - Global.unlocked_levels
	for i in $Levels.get_children():
		if i.level in range(Global.unlocked_levels + 1):
			i.enabled = true
			i.able()




