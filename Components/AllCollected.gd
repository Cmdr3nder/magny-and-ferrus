extends YSort


signal all_collected

onready var original_count = len(self.get_children())
onready var collected_count = 0


func _ready():
	for child in self.get_children():
		child.connect("collected", self, "_child_collected")


func _child_collected():
	collected_count += 1
	if collected_count >= original_count:
		emit_signal("all_collected")

