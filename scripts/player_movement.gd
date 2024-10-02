extends CharacterBody2D

@export var speed = 180
@export var rotation_speed = 1

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("turn_left", "turn_right")
	velocity = transform.x * Input.get_axis("drive_down", "drive_up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
