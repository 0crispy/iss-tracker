extends Spatial
class_name CameraMove

export var rotation_smoothing_speed = 50
 
var first_pos
var first_rotation
var dragging
var desired_rotation


var sensitivity = 1.0

var max_rotate = 250.0
var min_rotate = 110.0



# Called when the node enters the scene tree for the first time.
func _ready():
	desired_rotation = rotation_degrees
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var mouse_pos = get_viewport().get_mouse_position()
		desired_rotation = Vector3(desired_rotation.x,desired_rotation.y,0.0) + Vector3((first_pos.y - mouse_pos.y),(first_pos.x - mouse_pos.x),0.0) * sensitivity
		first_pos = get_viewport().get_mouse_position()
	rotation_degrees = lerp(rotation_degrees,desired_rotation,delta * rotation_smoothing_speed)
	var converted_rotation_degrees = Vector3(convert_angle(rotation_degrees.x),convert_angle(rotation_degrees.y),0.0)
	if converted_rotation_degrees.y < min_rotate:
		rotation_degrees.y = min_rotate
		desired_rotation.y = min_rotate
	elif converted_rotation_degrees.y > max_rotate:
		rotation_degrees.y = max_rotate
		desired_rotation.y = max_rotate
	if converted_rotation_degrees.x > min_rotate && converted_rotation_degrees.x < max_rotate:
		if converted_rotation_degrees.x < (min_rotate+max_rotate)/2.0:
			rotation_degrees.x = min_rotate
			desired_rotation.x = min_rotate
		else:
			rotation_degrees.x = max_rotate
			desired_rotation.x = max_rotate
	
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				dragging = true
				first_pos = event.position
				first_rotation = rotation_degrees
			if !event.pressed:
				dragging = false
				
func convert_angle(angle):
	var output = angle
	var flag = true
	while flag:
		flag = false
		if output > 360.0:
			flag = true
			output-=360.0
		elif output < 0.0:
			flag = true
			output+=360.0
	return output
