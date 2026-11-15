extends CharacterBody2D

var speed =289
var direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var window_size= Vector2(200,200)
func _physics_process(delta: float) -> void:
		velocity=Vector2(direction*speed, 0)
		move_and_slide()
		if is_on_wall():
			direction*= -1
			
	


func _ready() -> void:
	pass
		
		
