extends Control

@onready var heart_prefab = preload("res://scenes/prefabs/heart.tscn")
@onready var max_health = GameManager.max_player_health

var hearts = []
#player one = 0 player two = 1
var player :bool = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("update_health", update_health)
	for i in range(max_health):
		hearts.append(heart_prefab.instantiate())
		add_child(hearts[i])


func update_health(health: int, player: bool):
	if self.player == player:
		for i in range(health % max_health, max_health):
			hearts[i].update_icon(false)
