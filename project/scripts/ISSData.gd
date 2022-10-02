extends RichTextLabel
class_name ISSData

var latitude:float
var longitude:float
var altitude
var velocity
var dist_to_iss_from_camera

func _ready():
	add_color_override("custom_colors/default_color", Color(0,1,0,1))

func _process(delta):
	text = "-----------ISS DATA------------\n"+"Latitude:"+str(latitude)+"\nLongitude:"+str(longitude)+"\nAltitude:"+str(altitude) +" km"+"\nVelocity:"+str(velocity) + " km/h"
	text = text + "\nCurrently looking at ISS from a distance of " +str((round(dist_to_iss_from_camera*0.0331418033-1.6)*100.0)/100.0) + " km"
	# text = text + "\n\n\n\n\n\n\n\n\nSource code at https://github.com/0crispy/iss-tracker"
