extends Node2D


export(PackedScene) var next_level


func _on_Continue_pressed():
	get_tree().change_scene_to(next_level)
