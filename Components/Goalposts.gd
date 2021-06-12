extends Node2D


signal goal


onready var child_count = len(get_children())
onready var occupied_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.connect("occupied", self, "child_occupied")


func _enable():
	for child in get_children():
		child._enable()


func child_occupied(status):
	if status:
		occupied_count += 1
	else:
		occupied_count -= 1
		
	if occupied_count >= child_count:
		emit_signal("goal")
