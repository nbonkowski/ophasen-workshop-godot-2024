extends Node2D

@onready var menu = preload("res://scenes/main_menu.tscn")
@onready var end = preload("res://scenes/end_screen.tscn")
@onready var game = preload("res://scenes/game.tscn")

@onready var player_one_texture = load("res://sprites/PNG/Tanks/tankGreen_outline.png")
@onready var player_two_texture = load("res://sprites/PNG/Tanks/tankBlue_outline.png")
@onready var player_two_barrel = load("res://sprites/PNG/Tanks/barrelBlue_outline.png")

@export var max_player_health = 3
var player_one_health
var player_two_health
var player_two_won = false

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
		player_two_won = player_two_health > 0
		call_deferred("end_game")
	update_health.emit(player_two_health if player else player_one_health, player)
		
func reset():
	player_one_health = max_player_health
	player_two_health = max_player_health
	
func end_game():
	get_tree().change_scene_to_packed(end)
	
func start_game():
	reset()
	get_tree().change_scene_to_packed(game)

func quit():
	get_tree().quit()
