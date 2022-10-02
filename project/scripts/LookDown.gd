extends Button

export var camera_move_path:NodePath
onready var camera_move = get_node(camera_move_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	camera_move.desired_rotation = Vector3(0,180,0)
	camera_move.rotation_degrees = Vector3(0,180,0)
