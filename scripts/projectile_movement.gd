extends Area2D

@export var projectile_speed = 800

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#velocity = -transform.y * projectile_speed 
	$Timer.stop

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += -transform.y * projectile_speed * delta
	#move_and_slide()
		
func explode()-> void:
	queue_free()


func _on_timer_timeout() -> void:
	explode() 

func _on_body_entered(area: Area2D) -> void:
	explode()

func _on_area_entered(area: Area2D) -> void:
	explode()
