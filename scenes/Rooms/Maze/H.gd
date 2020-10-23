extends Node2D

onready var _to_front = "res://scenes/Rooms/Engine.tscn"
#onready var _to_left = "res://scenes/Rooms/Maze/B1.tscn"
#onready var _to_right = "res://scenes/Rooms/Maze/B.tscn"
onready var _to_back = "res://scenes/Rooms/Maze/G.tscn"
onready var water_shade = $water

func _ready():
	Sound.play_vent_move()
	$Flashlight.on_enter()
	$Flashlight/Light.texture_scale *= 2
	$Flashlight.flashlight_off()
	$sun/Sprite/AnimationPlayer.play("fire")
	
func _on_sun_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("sun gathered")
		Globals.has_sun = true
		Sound.play_fire_pick()
		water_shade.set_modulate(Color("#02155575"))
		$sun.set_visible(false)
		$to_front.set_visible(true)
		$Flashlight.flashlight_on()
	pass

func _on_to_front_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		$Flashlight.on_exit()
		if get_tree().change_scene(_to_front) != OK:
			print("Error on scene change to %s" % _to_front)
	pass
