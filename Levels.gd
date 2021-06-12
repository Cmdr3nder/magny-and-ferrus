extends Node2D


var current_level = null

func _ready():
	for child in $VBoxContainer.get_children():
		child.connect("start_level", self, "_start_level")


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$QuitButton.show()
		$VBoxContainer.show()
		if current_level != null:
			current_level.queue_free()
			current_level = null


func _on_QuitButton_pressed():
	get_tree().quit()


func _start_level(level):
	$QuitButton.hide()
	$VBoxContainer.hide()
	current_level = level.instance()
	self.add_child(current_level)
