extends Node2D

@onready var menu = preload("res://scenes/main_menu.tscn")

@onready var player_one_texture = load("res://sprites/PNG/Tanks/tankGreen.png")
@onready var player_two_texture = load("res://sprites/PNG/Tanks/tankBlue.png")

@export var max_player_health = 3
var player_one_health
var player_two_health

signal update_health(health, player)

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset()

func decreas_health(damage: int, player: bool):
	if player == false :
		player_one_health -= damage
	elif player == true:
		player_two_health -= damage
	if player_one_health <= 0 or player_two_health <= 0:	
		get_tree().change_scene_to_packed(menu)
	update_health.emit(player_two_health if player else player_one_health, player)
		
func reset():
	player_one_health = max_player_health
	player_two_health = max_player_health
