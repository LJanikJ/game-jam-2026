extends AudioStreamPlayer2D

var slide = [
	preload("res://resources/sound_effects/slide/slide1.wav"),
	preload("res://resources/sound_effects/slide/slide2.wav"),
	preload("res://resources/sound_effects/slide/slide3.wav"),
	preload("res://resources/sound_effects/slide/slide4.wav")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_started(anim_name: StringName) -> void:
	if anim_name == "slide_in":
		var index = randi_range(0,3)
		stream = slide[index]
		play()
