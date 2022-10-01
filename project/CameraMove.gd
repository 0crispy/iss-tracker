extends Spatial


export var rotation_smoothing_speed = 50
 
var first_pos
var first_rotation
var dragging
var desired_rotation


# Called when the node enters the scene tree for the first time.
func _ready():
	desired_rotation = rotation
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var mouse_pos = get_viewport().get_mouse_position()
		desired_rotation = desired_rotation + Vector3((first_pos.y - mouse_pos.y),(first_pos.x - mouse_pos.x),0.0) * 0.01
		first_pos = get_viewport().get_mouse_position()
		rotation = lerp(rotation,desired_rotation,delta * rotation_smoothing_speed)
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				dragging = true
				first_pos = event.position
				first_rotation = rotation
			if !event.pressed:
				dragging = false
				rotation += Vector3.UP* (first_pos.x - event.position.x) * 0.01
				
