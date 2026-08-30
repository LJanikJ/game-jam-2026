extends TextureButton

@onready var resume_button = $"../resumeButton"

func _on_pressed():
	get_tree().paused = true
	resume_button.visible = true

	
