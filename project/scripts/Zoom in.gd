extends Button

export var camera_zoom_path:NodePath
onready var camera_zoom = get_node(camera_zoom_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	camera_zoom.desired_z =camera_zoom.min_z
