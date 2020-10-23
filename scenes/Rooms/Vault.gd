extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pile_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		$final_scene/AnimationPlayer.play("gold_to_sand")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(_anim_name):
	if _anim_name == "gold_to_sand":
		$final_scene/AnimationPlayer.play("monster_attacks")
	pass # Replace with function body.
