extends Node

var levels = ['res://levels/Level1.tscn',
			  'res://levels/Level2.tscn', 'res://levels/Level3.tscn', 'res://levels/Level4.tscn', 'res://levels/Level5.tscn', 'res://levels/Level6.tscn', 'res://levels/Level7.tscn', 'res://levels/Level8.tscn', 'res://levels/Level9.tscn', 'res://levels/Level10.tscn']

var unlocked_levels = 1
var current_level
var score
var progress_file = "user://progress.txt"
var start_screen = 'res://ui/StartScreen.tscn'
var end_screen = 'res://ui/GameOverScreen.tscn'
#there is a problerm here.  incrementing the level unlocked instead 
#of setting it is a problem. because it add +1 when even if you redo a previous level

func new_game():
	current_level = -1
	score = 0
	next_level()
	setup()

func next_level():
	current_level =  current_level + 1
	if current_level >= Global.levels.size():
		game_over()
	else:
		get_tree().change_scene(levels[current_level])


func game_over():
	get_tree().change_scene(end_screen)

#Progress saving and clearing
func clear_progress():
	var f = File.new()
	f.open(progress_file, File.WRITE)
	f.store_string(str(1))
	f.close()

func setup():
	var f = File.new()
	if f.file_exists(progress_file):
		f.open(progress_file, File.READ)
		var content = f.get_as_text()
		unlocked_levels = int(content)
		f.close()


func save_progress():
	var f = File.new()
	f.open(progress_file, File.WRITE)
	f.store_string(str(unlocked_levels))
	f.close()


#the Coin score functionality










