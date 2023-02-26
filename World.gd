extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
	$vomit_popup.hide()
	$mating_popup.hide()
	
	$ambience.play()
	pass


func _process(delta):
	if !get_tree().paused:
		var randval = rand_range(0.0,1.0)
		if randval < (2.0/(60.0*60.0)) and randval > (1.0/(60.0*60.0)):
			get_tree().paused = true
			$vomit_popup.show()
			$fx_vomit3.play()
		elif randval < (1.0/(60.0*60.0)):
			get_tree().paused = true
			$mating_popup.show()
			$fx_splat1.play()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			$vomit_popup.hide()
			$mating_popup.hide()
			get_tree().paused = false
