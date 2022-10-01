extends Spatial

const star = preload("res://models/stars/star.tscn")

export var camera:NodePath
var camera_node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	camera_node = get_node(camera)
	for i in 10:
		var star_instance = star.instance()
		add_child(star_instance)
		var dir = Vector3(randf()-0.5,randf()-0.5,randf()-0.5).normalized()
		star_instance.translation = dir * 100000.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation = camera_node.global_transform.origin
	#rotation = camera_node.global_transform.basis.get_euler()
	pass
