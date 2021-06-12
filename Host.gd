extends Node2D


export(PackedScene) var next_level


# Called when the node enters the scene tree for the first time.
func _ready():
	$Credits.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LoadIn_done():
	$LoadIn.queue_free()


func _on_MainMenu_quit():
	get_tree().quit()


func _on_Credits_back():
	$Credits.hide()
	$MainMenu.show()


func _on_MainMenu_credits():
	$MainMenu.hide()
	$Credits.show()


func _on_MainMenu_start():
	get_tree().change_scene_to(next_level)
