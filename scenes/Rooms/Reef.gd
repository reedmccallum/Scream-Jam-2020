extends Node2D

onready var _next_scene = "res://scenes/Rooms/ShipExt.tscn"
onready var flashlight = $Flashlight

func _ready():
	Sound.play_ambience()
	flashlight.on_enter()

func _on_ship_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		if get_tree().change_scene(_next_scene) != OK:
			print("Error on scene change to %s" % _next_scene)

func _on_monster_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("monster clicked")
		$monster/Sprite/AnimationPlayer.play("monster fade")
		Sound.play_monster_near()
		Cursor.hide()
		$monster/CollisionShape2D.set_visible(false)
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(_anim_name):
	$monster.set_visible(false)
	$monster.set_monitorable(false)
	$ship.set_visible(true)
	$ship.set_monitorable(true)
	Cursor.show()
	pass # Replace with function body.
