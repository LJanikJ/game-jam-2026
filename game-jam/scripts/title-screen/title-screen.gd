extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main/game-scene.tscn")



func _on_optionsbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options-screen/options-screen.tscn")
