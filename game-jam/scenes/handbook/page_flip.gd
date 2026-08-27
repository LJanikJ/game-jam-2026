extends AudioStreamPlayer2D

var open = preload("res://resources/sound_effects/book/open.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = open


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_handbook_button_pressed() -> void:
	volume_db = 0.0
	play()


func _on_page_sprite_texture_changed() -> void:
	volume_db = -5.0
	play()
