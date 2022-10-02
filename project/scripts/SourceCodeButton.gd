extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	OS.shell_open("https://github.com/0crispy/iss-tracker")
