extends Control

@onready var heart_prefab = preload("res://scenes/prefabs/heart.tscn")
#player one = 0 player two = 1
@export var player :bool = 0 

@onready var max_health = HealthManager.max_player_health
var hearts = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HealthManager.connect("update_health", update_health)
	for i in range(max_health):
		hearts.append(heart_prefab.instantiate())
		$HBoxContainer.add_child(hearts[i])


func update_health(health: int, player: bool):
	if self.player == player:
		for i in range(health % max_health, max_health):
			hearts[i].update_icon(false)
