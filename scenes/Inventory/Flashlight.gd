extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target = Vector2(0,0)
onready var light = $Light

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion:
		target = get_global_mouse_position()
		print(target)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	light.position = target
