extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var brother_one_pos = Vector2(0, 0)
var brother_two_pos = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _update_one_pos(pos):
	brother_one_pos = pos
	update()

func _update_two_pos(pos):
	brother_two_pos = pos
	update()

func _draw():
	draw_line(brother_one_pos, brother_two_pos, Color.rebeccapurple, 2.0, false)
