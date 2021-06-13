extends Node2D


signal done


func _on_Collectibles_all_collected():
	$Goalposts._enable()


func _on_Goalposts_goal():
	emit_signal("done", null)
