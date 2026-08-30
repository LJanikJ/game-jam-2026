extends TextureButton

func _on_pressed():
	get_tree().paused = false
	visible = false
