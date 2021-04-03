extends "res://character/Character.gd"

func _ready():
	can_move = false
	#make go in a random direction
	facing = moves.keys()[randi() % 4]
	yield(get_tree().create_timer(0.5), "timeout")
	can_move = true


func _process(delta):
	if can_move:
		#randomize the movement in a different direction every 10 to 5 seconds. 
		if not move(facing) or randi() % 10 > 5:
			facing = moves.keys()[randi() % 4]
