extends Node2D

onready var _normal = $mouse/normal
onready var _animated = $mouse/animated

var _overlaps = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$mouse/animated/AnimationPlayer.play("interact")

func _process(_delta):
	set_global_position(get_global_mouse_position())

func _on_mouse_area_entered(_area):
	_overlaps += 1
	if _overlaps > 0:
		_normal.hide()
		_animated.show()
	print("area entered: %d" % _overlaps)

func _on_mouse_area_exited(_area):
	_overlaps -= 1
	if _overlaps < 1:
		_normal.show()
		_animated.hide()
	print ("area exited: %d" % _overlaps)
