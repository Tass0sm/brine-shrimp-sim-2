extends MultiMeshInstance

var mm
var instance_count = 64
var blob_mesh = preload("res://Blob.tres")
var sphere_radius = 5

var currentWaveDirection = Vector3(1, 0, 0)
var currentWaveSpeed = 0.0
var currentWaveRotationAxis = Vector3(0, 1, 0)
var currentWaveAngularSpeed = 0.0
var currentScaleSpeed = 0.0

func _ready():
	# Create multimesh resource that will contain 4 cubes
	mm = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.instance_count = instance_count
	mm.mesh = blob_mesh
	
	
	print(mm.mesh)

	# Set position of all cubes at random
	for i in range(mm.instance_count):
		var theta = randf() * 2 * PI # (randf() * PI / 2) - (PI / 4) # z-x plane
		var phi = randf() * 2 * PI # (randf() * PI / 2) - (PI / 4) # z-y plane
		var radius = (randf() * 4) + sphere_radius - 4
		
		var pos = Vector3(
				cos(phi) * sin(theta) * radius,
				sin(phi) * radius,
				cos(phi) * cos(theta) * radius)
				
		var t = Transform(Basis(), pos)
		mm.set_instance_transform(i, t)

	# Assign multimesh to be rendered by the MultiMeshInstance
	self.multimesh = mm
	
func _process(delta):
	var time = Time.get_unix_time_from_system()
	currentWaveRotationAxis = currentWaveRotationAxis.rotated(Vector3.BACK, 0.1 * delta)
	currentWaveAngularSpeed = 0.3 * cos(time) + 0.25
	currentScaleSpeed = 2 * cos(time)
	
		# Set position of all cubes at random
	for i in range(mm.instance_count):
		var t = mm.get_instance_transform(i)
		var custom_data = mm.get_instance_custom_data(i)
		var angular_speed_vari = custom_data.r
		var scale_speed_vari = custom_data.g
		
		t = t.scaled(Vector3(1, 1, 1) + (Vector3(1, 1, 1) * (currentScaleSpeed + scale_speed_vari) * delta))
		#t = t.translated(currentWaveDirection * currentWaveSpeed * delta)
		t = t.rotated(currentWaveRotationAxis, (currentWaveAngularSpeed + angular_speed_vari) * delta)
		mm.set_instance_transform(i, t)	
		
	
