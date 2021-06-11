extends KinematicBody2D

signal broadcast_pos(pos)

var other_brother_pos = Vector2(0, 0)
export(int) var connection_force = 1
export(int) var speed = 200
export(String) var up_btn = "p1_up"
export(String) var down_btn = "p1_down"
export(String) var left_btn = "p1_left"
export(String) var right_btn = "p1_right"

func listen_other_pos(pos):
	other_brother_pos = pos


func _process(delta):
	var magnetic_mult = global_position.distance_to(other_brother_pos) * connection_force
	var magnetic_force = global_position.direction_to(other_brother_pos).normalized()
	var control_force = Vector2(0, 0)
	if Input.is_action_pressed(up_btn):
		control_force.y -= 1
	if Input.is_action_pressed(down_btn):
		control_force.y += 1
	if Input.is_action_pressed(left_btn):
		control_force.x -= 1
	if Input.is_action_pressed(right_btn):
		control_force.x += 1
	control_force = control_force.normalized()
	# include controls force too
	var impulse = (magnetic_force * magnetic_mult) + (control_force * speed)
	move_and_slide(impulse)
	emit_signal("broadcast_pos", global_position)
