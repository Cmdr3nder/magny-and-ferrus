extends Node2D


signal goal


onready var child_count = len(get_children()) - 3
onready var occupied_count = 0
onready var transport_played = false


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.connect("occupied", self, "child_occupied")


func _enable():
	$UnlockingTimer.start()


func child_occupied(status):
	if status:
		occupied_count += 1
	else:
		occupied_count -= 1
		
	if occupied_count >= child_count:
		if !transport_played:
			transport_played = true
			$Transport.play()


func _on_UnlockingTimer_timeout():
	$Unlocking.play()
	for child in get_children():
		if child.has_method("_enable"):
			child._enable()


func _on_Transport_finished():
	emit_signal("goal")
