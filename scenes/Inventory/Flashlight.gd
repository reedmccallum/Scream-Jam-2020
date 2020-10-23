extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target = Vector2(0,0)
onready var light = $Light
onready var tween = $Tween
onready var obscure = $Obscure

# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.has_power:
		flashlight_off()
	pass # Replace with function body.

func flashlight_off():
	obscure.set_visible(false)
	light.set_visible(false)

func flashlight_on():
	obscure.set_visible(true)
	light.set_visible(true)

func _input(event):
	if event is InputEventMouseMotion:
		target = get_viewport().get_mouse_position()
	light_chase()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	light.position = target
func light_chase():
	light.position = target

func on_enter():
	tween.interpolate_property(obscure, "modulate", Color(1,1,1,2), Color(1,1,1,1), 0.5, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	tween.start()
#	obscure.set_modulate(Color(1,1,1,2))

func on_exit():
	tween.interpolate_property(obscure, "modulate", Color(1,1,1,1), Color(1,1,1,2),0.5, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	tween.start()

