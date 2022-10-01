extends RichTextLabel
class_name ISSData

var latitude:float
var longitude:float
var altitude
var velocity

func _ready():
	add_color_override("custom_colors/default_color", Color(0,1,0,1))

func _process(delta):
	text = "-----------ISS DATA------------\n"+"Latitude:"+str(latitude)+"\nLongitude:"+str(longitude)+"\nAltitude:"+str(altitude)+"\nVelocity:"+str(velocity)

