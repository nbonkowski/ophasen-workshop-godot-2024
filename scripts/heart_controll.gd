extends TextureRect

@onready var heart_texture_full = preload("res://sprites/PNG/Hearts/platformPack_item017.png")
@onready var heart_texture_empty = preload("res://sprites/PNG/Hearts/platformPack_item005.png")


@export var is_active = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_icon(is_active)
	
func update_icon(is_active:bool):
	self.is_active = is_active
	if (is_active):
		texture = heart_texture_full
	else:
		texture = heart_texture_empty
		
