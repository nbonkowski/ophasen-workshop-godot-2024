extends Node2D

@export var max_player_health = 3
var player_one_health
var player_two_health

signal update_health(health, player)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_one_health = max_player_health
	player_two_health = max_player_health

func decreas_health(damage: int, player: bool):
	if player == false :
		player_one_health -= damage
	elif player == true:
		player_two_health -= damage
	update_health.emit(player_two_health if player else player_one_health, player)
		
