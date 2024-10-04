extends CharacterBody2D

@export var speed = 180
@export var rotation_speed = 1
@export var is_player_two = false

@onready var PROJECTILE = preload("res://scenes/prefabs/tank_projectile.tscn")

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("turn_left", "turn_right")
	velocity = transform.y * Input.get_axis("drive_up", "drive_down") * speed

func _physics_process(delta):
	if Input.is_action_just_pressed("fire_tank"):
		var projectile = PROJECTILE.instantiate()
		projectile.rotation = rotation
		get_node("/root/Game/").add_child(projectile)
		projectile.global_position = $Projectile_Marker.global_position
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()


#is called when hit by a projectile
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("TankProjectile"):
		HealthManager.decreas_health(1,is_player_two)
