extends Button


signal start_level(PackedScene)


export(PackedScene) var level


func _ready():
	self.connect("pressed", self, "_on_pressed")


func _on_pressed():
	emit_signal("start_level", level)
