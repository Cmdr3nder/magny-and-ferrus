extends Node2D


func _on_Collectible_body_entered(body):
	queue_free()
