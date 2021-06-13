extends Node2D


var game_completed = false
var current_level = null

func _ready():
	for child in $VBoxContainer.get_children():
		child.connect("start_level", self, "_start_level")
	_start_level(load("res://Levels/Main.tscn"))


func cancel():
	$QuitButton.show()
	$VBoxContainer.show()
	if current_level != null:
		current_level.queue_free()
		current_level = null


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		cancel()


func _on_QuitButton_pressed():
	get_tree().quit()


func _start_level(level):
	$QuitButton.hide()
	$VBoxContainer.hide()
	current_level = level.instance()
	current_level.connect("done", self, "_next_level")
	self.add_child(current_level)


func _next_level(level):
	if game_completed:
		cancel()
	elif level != null:
		current_level.queue_free()
		_start_level(level)
	else:
		game_completed = true
		$GameComplete.play()
		cancel()
