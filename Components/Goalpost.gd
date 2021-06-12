extends Area2D


signal occupied(status)


export(String, "Flash", "BlueBro", "Off", "RedBro") var on_animation = "Flash"


onready var occupant_count = 0
onready var enabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Off")
	pass # Replace with function body.


func _on_Goalpost_body_entered(body):
	occupant_count += 1
	update_occupied()


func _on_Goalpost_body_exited(body):
	occupant_count -= 1
	update_occupied()


func update_occupied():
	if enabled:
		emit_signal("occupied", occupant_count == 1)

func _enable():
	enabled = true
	$AnimationPlayer.play(on_animation)
