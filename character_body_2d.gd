extends CharacterBody2D



var bulletpath =preload("res://node_2d.tscn")


func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):
		fire()
	 
func fire():
	var bullet=bulletpath.instantiate()
	bullet.dir=rotation
	bullet.pos=$ball.global_position
	bullet.rota=global_rotation
	get_parent().add_child(bullet)
		
