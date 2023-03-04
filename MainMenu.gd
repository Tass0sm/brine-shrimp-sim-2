extends MarginContainer

signal play_pressed
signal instructions_pressed
signal credits_pressed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	$title.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Play_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_Instructions_pressed():
	emit_signal("instructions_pressed")

func _on_Credits_pressed():
	emit_signal("credits_pressed")
