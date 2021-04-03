extends Node2D


export (int) var level
export (bool) var enabled
export (bool) var score_goal_met
export (String) var level_to_load

#texture
export (Texture) var blocked_texture
export (Texture) var open_texture
export (Texture) var goal_met
export (Texture) var goal_not_met

onready var level_label = $TextureButton/Label
onready var button = $TextureButton
onready var star = $Sprite

func _ready():
	setup()


func setup():
	level_label.text = String(level) 
	if enabled:
		button.texture_normal = open_texture
	else:
		button.texture_normal = blocked_texture
		button.disabled = true

func able():
	button.texture_normal = open_texture
	button.disabled = false

func _on_TextureButton_pressed():
	get_tree().change_scene("res://levels/Level" +  String(level)  + ".tscn")
	Global.current_level = level -1
	Global.score = 0

