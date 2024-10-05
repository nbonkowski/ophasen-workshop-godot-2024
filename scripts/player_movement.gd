extends CharacterBody2D

@export var speed = 180
@export var rotation_speed = 1
@export var is_player_two = false
@export var max_player_health = 3

@onready var PROJECTILE = preload("res://scenes/prefabs/tank_projectile.tscn")

@onready var turn_left = "turn_left" if !is_player_two else "player_two_turn_left"
@onready var turn_right = "turn_right" if !is_player_two else "player_two_turn_right"
@onready var drive_up = "drive_up" if !is_player_two else "player_two_drive_up"
@onready var drive_down = "drive_down" if !is_player_two else "player_two_drive_down"
@onready var fire_tank = "fire_tank" if !is_player_two else "player_two_fire_tank"

var rotation_direction = 0
var is_loaded = true


func get_input():
	rotation_direction = Input.get_axis(turn_left, turn_right)
	velocity = transform.y * Input.get_axis(drive_up, drive_down) * speed

func _physics_process(delta):
	get_input()
	fire()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
	
func fire():
	if is_loaded and Input.is_action_just_pressed(fire_tank):
		is_loaded = false
		var projectile = PROJECTILE.instantiate()
		projectile.rotation = rotation
		get_node("/root/Game/").add_child(projectile)
		projectile.global_position = $Projectile_Marker.global_position
		rotation_direction = 0
		$FireDelay.start()

#is called when hit by a projectile
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("TankProjectile"):
		HealthManager.decreas_health(1,is_player_two)


func _on_fire_delay_reaload() -> void:
	is_loaded = true
