extends HTTPRequest

export var text_label_path:NodePath
onready var text_label:ISSData = get_node(text_label_path)

export var iss_handle_path:NodePath
onready var iss_handle = get_node(iss_handle_path)

export var iss_spatial_path:NodePath
onready var iss_spatial = get_node(iss_spatial_path)

var desired_rotation
var desired_altitude

var first_time = true

var timer = 1.0

func _ready():
	connect("request_completed", self, "_on_request_completed")
	request("https://api.wheretheiss.at/v1/satellites/25544")
	desired_rotation = iss_handle.rotation_degrees
	desired_altitude = iss_spatial.translation.z
	

func _on_request_completed(result, response_code, headers, body):

	#print(body.get_string_from_utf8())
	
	var json = JSON.parse(body.get_string_from_utf8())
	if json.result == null:
		return
	desired_rotation = Vector3(json.result.latitude,json.result.longitude,0.0)
	desired_altitude = -(6370.0 + json.result.altitude)/12.742*10.0
	
	if first_time:
		iss_handle.rotation_degrees = desired_rotation
		iss_spatial.translation.z = desired_altitude
		first_time = false
	
	text_label.latitude = json.result.latitude
	text_label.longitude = json.result.longitude
	text_label.altitude = json.result.altitude
	text_label.velocity = json.result.velocity
	
func _process(delta):
	timer-=delta
	if timer <= 0:
		timer = 1.0
		request("https://api.wheretheiss.at/v1/satellites/25544")
	
	iss_handle.rotation_degrees = lerp(iss_handle.rotation_degrees,desired_rotation,delta*0.5)
	iss_spatial.translation.z = lerp(iss_spatial.translation.z,desired_altitude,delta*0.5)
	
