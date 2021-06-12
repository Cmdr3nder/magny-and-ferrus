extends Node2D


signal done


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")


func _on_AnimatedSprite_animation_finished():
	emit_signal("done")
