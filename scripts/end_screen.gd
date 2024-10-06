extends Control

@onready var player_two_won = GameManager.player_two_won

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player_two_won:
		$CenterContainer/VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer2/TextureRect.texture = GameManager.player_two_texture
		$CenterContainer/VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer2/TextureRect/TextureRect3.texture = GameManager.player_two_barrel
		$CenterContainer/VBoxContainer/WinMessage.text = "[center]Player Two Won[/center]"

func _on_start_button_pressed() -> void:
	GameManager.start_game()

func _on_quit_button_pressed() -> void:
	GameManager.quit()
