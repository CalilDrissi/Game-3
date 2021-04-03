extends Area2D

export (int) var speed

var tile_size = 55
var can_move = true
var facing = 'right'

#to give direction
var moves = {"right": Vector2(1, 0), "left": Vector2(-1, 0), "up" : Vector2(0, -1),"down": Vector2(0, 1)}

#to check for obstacles
onready var raycasts = {"right": $RayCastRight, "left": $RayCastLeft, "up": $RayCastUp, "down": $RayCastDown}

#the movement algorithm 
func move(dir):
	$AnimationPlayer.playback_speed = speed
	facing = dir
	if raycasts[facing].is_colliding():
		return
	can_move = false
	$AnimationPlayer.play(facing)
	$MoveTween.interpolate_property(self, "position", position, position + moves[facing] * tile_size, 1.0 / speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$MoveTween.start()
	return true

#to re-enable the movement
func _on_MoveTween_tween_completed(object, key):
	can_move = true
