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
func _process(delta):
	time += delta
	random_processes()
	

func random_processes():
	if !get_tree().paused and eventTakingPlace == false:
		var randval = rand_range(0.0,1.0)
		if randval < (3.0/(60.0*60.0)) and randval > (2.0/(60.0*60.0)):
			# algal bloom event!
			$GUI/algal_bloom_popup.show()
			$fx_vomit3.play()
			eventTakingPlace = true
			eventBeginTime = time
			eventType = 'algalBloom'
		elif randval < (2.0/(60.0*60.0)) and randval > (1.0/(60.0*60.0)):
			get_tree().paused = true
			$GUI/vomit_popup.show()
			$fx_vomit3.play()
		elif randval < (1.0/(60.0*60.0)):
			get_tree().paused = true
			$GUI/mating_popup.show()
			$fx_splat1.play()
	if time > eventDuration + eventBeginTime:
		eventTakingPlace = false
		if eventType == 'algalBloom':
			$GUI/algal_bloom_popup.hide()
	if eventTakingPlace:
		if eventType == 'algalBloom':
			pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			$GUI/vomit_popup.hide()
			$GUI/mating_popup.hide()
			get_tree().paused = false
