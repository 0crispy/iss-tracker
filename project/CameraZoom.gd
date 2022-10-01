extends Camera


#export var camera_spatial_path:NodePath
#onready var camera_spatial = get_node(camera_spatial_path)

var min_z = 50
var max_z = 600000
var desired_z = 650
var camera_zoom_speed = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	desired_z = clamp(desired_z,min_z,max_z)
	translation.z = lerp(translation.z,desired_z,delta*10)
	
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				desired_z -= desired_z/min_z  * camera_zoom_speed
			if event.button_index == BUTTON_WHEEL_DOWN:
				desired_z += desired_z/min_z * camera_zoom_speed
