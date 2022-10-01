extends Node2D
export var iss_data_path:NodePath
onready var iss_data:ISSData = get_node(iss_data_path)

func _process(delta):
	var x1 = iss_data.longitude*4096.0/180.0
	var y1 = iss_data.latitude*-2048.0/90.0
	position = Vector2(x1,y1)
