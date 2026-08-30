extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tabletop_view_sfx(sfx: String) -> void:
	stream = load("res://resources/sound_effects/item/"+sfx+".wav")
	play()


func _on_spell_1_pressed() -> void:
	stream = load("res://resources/sound_effects/spell/spell.wav")
	play()
