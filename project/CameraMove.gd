extends Spatial
class_name CameraMove

export var rotation_smoothing_speed = 50
 
var first_pos
var first_rotation
var dragging
var desired_rotation

var sensitivity = 1.0


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
	# rotation_degrees.x = clamp(90.0,270.0,rotation_degrees.x)
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
				
