extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time = 0.0
var eventTakingPlace = false
var eventBeginTime = 0.0
var eventDuration = 5.0
var eventType = 'algalBloom'

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	eventTakingPlace = false
	
	$GUI/vomit_popup.hide()
	$GUI/mating_popup.hide()
	$GUI/algal_bloom_popup.hide()

	$ambience.play()
	pass

# simulating random processes
#func _process(delta):
#	pass
	
func _on_EventManager_vomit():
	$GUI/vomit_popup.show()
	$fx_vomit3.play()

func _on_EventManager_mate():
	$GUI/mating_popup.show()
	$fx_splat1.play()

func _on_EventManager_normal():
	$GUI/vomit_popup.hide()
	$GUI/mating_popup.hide()
