extends Node2D


signal quit
signal start
signal credits


func _on_QuitButton_pressed():
	emit_signal("quit")


func _on_StartButton_pressed():
	emit_signal("start")


func _on_CreditsButton_pressed():
	emit_signal("credits")
