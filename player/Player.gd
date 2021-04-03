extends "res://character/Character.gd"

signal moved
signal dead
signal grabbed_key
signal win


#the movement algorithm 
# warning-ignore:unused_argument
func _process(delta):
	if can_move:
		for dir in moves.keys():
			if Input.is_action_pressed(dir):
				if move(dir):
					emit_signal('moved')


#the response to colliding with other objects
func _on_Player_area_entered( area ):
	if area.is_in_group('enemies'):
		area.hide()
		$CollisionShape2D.disabled = true
		set_process(false)
		emit_signal('dead')
	if area.has_method('pickup'):
		area.pickup()
		if area.type == 'key_red':
			emit_signal('grabbed_key')
		if area.type == 'star':
			$CollisionShape2D.disabled = true
			emit_signal('win')
