extends Node2D

enum State {
	NONE,
	COIN,
	ARM,
	SUN,
	EYE
}

onready var coin = $Coin
onready var arm = $Arm
onready var sun = $Sun
onready var eye = $Eye


func _ready():
	#var coin_node = get_node('Scene/Coin')
	#coin_node.connect("coin_gathered", self, "_on_coin_gathered")
	pass

func _on_coin_gathered():
	print("Updating inventory")
	coin.set_visibility(true)
