extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_dialogue_label_started_typing() -> void:
	disabled = true


func _on_dialogue_label_hidden() -> void:
	disabled = false


func _on_accept_button_pressed() -> void:
	disabled = true


func _on_pressed() -> void:
	disabled = true


func _on_timer_timeout() -> void:
	pressed.emit()
