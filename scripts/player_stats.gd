extends Control

@export var is_player_two = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !is_player_two:
		$PanelContainer/HSplitContainer/MarginContainer/TextureRect.texture = GameManager.player_one_texture
	elif is_player_two:
		$PanelContainer/HSplitContainer/MarginContainer/TextureRect.texture = GameManager.player_two_texture
	$PanelContainer/HSplitContainer/LifeBar.player = is_player_two


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
