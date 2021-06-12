extends Node2D


signal done


export(PackedScene) var next_level = load("res://Levels/Main.tscn")


onready var all_collected = false


func _on_Collectibles_all_collected():
	all_collected = true
	$Goalposts._enable()


func _on_Goalposts_goal():
	print("done!")
	emit_signal("done", next_level)
