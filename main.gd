extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var game_scene = preload("res://World.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$title.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_MainMenu_play_pressed():
	get_tree().change_scene("res://World.tscn")
