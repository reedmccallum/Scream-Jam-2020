extends Node2D

var sound = null
onready var ambience = $Ambience
onready var music = $Music
onready var arm_break = $arm_break
onready var coin = $coin
onready var door_lock = $door_lock
onready var eye_squish = $eye_squish
onready var fire_furnace = $fire_furnace
onready var fire_pick = $fire_pick
onready var monster_atk = $monster_atk
onready var monster_near = $monster_near
onready var open_vent = $open_vent
onready var test_click = $test_click
onready var vault_open = $vault_open

onready var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_ambience():
	ambience.play()
func stop_ambience():
	ambience.stop()
func play_music():
	music.play()
func play_arm_break():
	arm_break.play()
func play_coin():
	coin.play()
func play_door_lock():
	door_lock.play()
func play_eye_squish():
	eye_squish.play()
func play_fire_furnace():
	fire_furnace.play()
func play_fire_pick():
	fire_pick.play()
func play_monster_atk():
	monster_atk.play()
func play_monster_near():
	monster_near.play()
func play_open_vent():
	open_vent.play()
func play_test_click():
	test_click.play()
func play_vault_open():
	vault_open.play()
func play_vent_move():
	var _vent_move = vault_open
	rng.randomize()
	var _pitches = [0.95, 1, 1.05]
	_vent_move.set_pitch_scale(_pitches[randi() % _pitches.size()])
	_vent_move.play(.5)
