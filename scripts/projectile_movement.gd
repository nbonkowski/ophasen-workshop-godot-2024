extends Area2D

@export var projectile_speed = 800
@export var is_player_two = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_player_two:
		$Sprite2D.play("default_player_two")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += -transform.y * projectile_speed * delta
		
func explode()-> void:
	$Timer.stop()
	projectile_speed = 0
	$Sprite2D.play("explosion")
	$Sprite2D.connect("animation_looped",queue_free)

func _on_timer_timeout() -> void:
	explode() 

func _on_area_entered(area: Area2D) -> void:
	if !area.is_in_group("TankProjectile"):
		explode()
