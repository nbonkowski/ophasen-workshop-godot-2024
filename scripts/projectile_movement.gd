extends CharacterBody2D

@export var projectile_speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = -transform.y * projectile_speed 
	$Timer.stop

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
		
func explode()-> void:
	queue_free()
	


func _on_timer_timeout() -> void:
	explode() # Replace with function body.
