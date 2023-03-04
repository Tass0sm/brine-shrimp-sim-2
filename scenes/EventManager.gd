extends Node

signal mate
signal vomit
signal normal

# The event manager is like a state machine. There is a normal state in the
# center. Every time the timer elapses, it randomly moves to one of the event
# states. We'll change it later if we want to make events not mutually
# exclusive. AFter an event, the event timer is paused and a wait timer is
# started. Once the wait timer elapses we move back to the normal state and
# restart the event timer.

# an array of events,
# (space lower bound, space upper bound, label, wait_time)
var event_array = [[0.0, 0.1, "mate",  10.0],
				   [0.1, 0.2, "vomit", 10.0]]
				
var current_state = "normal"

func choose_event():
	var v = rand_range(0.0,1.0)
	
	for event in event_array:
		var lower_bound = event[0]
		var upper_bound = event[1]
		var event_type = event[2]
		var wait_time = event[3]
		
		if lower_bound < v and v < upper_bound:
			current_state = event_type
			emit_signal(event_type)
			$EventPeriodTimer.stop()
			$WaitTimer.wait_time = wait_time
			$WaitTimer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_WaitTimer_timeout():
	$EventPeriodTimer.start()
	emit_signal("normal")
	$WaitTimer.stop()

func _on_EventPeriodTimer_timeout():
	print("event")
	choose_event()
