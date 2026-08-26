extends AudioStreamPlayer2D

var flip = preload("res://resources/sound_effects/book/flip.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_handbook_button_pressed() -> void:
	stream = flip
	play()
