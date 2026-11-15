extends CharacterBody2D

const P = 7.0

const drag= 200.0
var gravity = 800.0
var dec = 0.7
var resting = true
var dragging = false
var start = Vector2.ZERO


func _physics_process(delta):
	velocity.y +=  gravity * delta
	var collision = move_and_collide(velocity * delta)
	if collision:
		
		velocity = velocity.bounce(collision.get_normal()) *  dec
		velocity.x *= 0.9
		if velocity.length() < 40.0:
			velocity = Vector2.ZERO
			resting = true
	if dragging:
		queue_redraw()


func _pull() -> Vector2:
	return (start - get_global_mouse_position()).limit_length(drag)


func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and resting:
			dragging = true
			start = get_global_mouse_position()
		elif not event.pressed and dragging:
			dragging = false
			queue_redraw()
			var pull = _pull()
			if pull.length() > 20.0:
				velocity = pull * P
				resting = false


func _draw():
	if dragging:
		var v = _pull() * P
		var p = Vector2.ZERO
		
		for i in 60:
			v.y += gravity / 60.0
			p += v / 60.0
			
