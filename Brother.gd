extends KinematicBody2D

signal broadcast_pos(pos)

var other_brother_pos = Vector2(0, 0)
export(int) var connection_force = 100

func listen_other_pos(pos):
	other_brother_pos = pos


func _process(delta):
	var magnetic_force = global_position.direction_to(other_brother_pos).normalized()
	# include controls force too
	move_and_slide(magnetic_force * connection_force)
	emit_signal("broadcast_pos", global_position)
