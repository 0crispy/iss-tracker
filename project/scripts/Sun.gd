extends DirectionalLight

export var sun_handle_path:NodePath
onready var sun_handle = get_node(sun_handle_path)

func _process(delta):
	var datetime_dict = Time.get_datetime_dict_from_system(true )
	var hours = float(datetime_dict.hour) + float(datetime_dict.minute)/60.0
	rotation_degrees.y = hours/24.0*360.0 + 180.0
	sun_handle.rotation_degrees.y = hours/24.0*360.0 + 180.0
