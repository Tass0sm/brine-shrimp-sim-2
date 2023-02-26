extends KinematicBody

# var rng = RandomNumberGenerator.new()

var base_speed = 0.55
var base_swim_freq = 0.65
var base_direction_delta = 0.005

var time : float

var direction = Vector3.ZERO
var magnitude : float
var velocity = Vector3.ZERO	

func initialize():
	# time = 0
	# magnitude = base_speed*((cos(2*PI*base_swim_freq*time)) + 1.5)
	var x = rand_range(-1.0,1.0)
	var y = rand_range(-1.0,1.0)
	var z = rand_range(-1.0,1.0)
	direction = Vector3(x,y,z)
	direction = direction.normalized()
	
func _physics_process(_delta):
	# warning-ignore:return_value_discarded
	time += _delta
	direction = get_direction()
	magnitude = get_forward_speed()
	velocity = magnitude*direction
	move_and_slide(velocity)
	rotation = direction

func get_forward_speed():
	return base_speed*((cos(2*PI*base_swim_freq*time)) + 1.5)

func get_direction():
	var dx = base_direction_delta*sin(0.42*time)
	var dy = base_direction_delta*sin(0.35*time)
	var dz = base_direction_delta*sin(0.3*time)
	var temp_direction = direction + Vector3(dx, dy, dz)
	return temp_direction.normalized()
