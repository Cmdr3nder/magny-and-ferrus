extends Node2D


signal collected


func _on_Collectible_body_entered(body):
	emit_signal("collected")
	queue_free()
