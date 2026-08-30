extends Node2D

var master_idx = AudioServer.get_bus_index("Master")
var bgm_idx = AudioServer.get_bus_index("BGM")
var sfx_idx = AudioServer.get_bus_index("SFX")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/MasterSlider.value = db_to_linear(AudioServer.get_bus_volume_db(master_idx))
	$VBoxContainer/BGMSlider.value = db_to_linear(AudioServer.get_bus_volume_db(bgm_idx))
	$VBoxContainer/SFXSlider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_idx))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_master_slider_drag_ended(value_changed: bool) -> void:
	AudioServer.set_bus_volume_db(master_idx, linear_to_db($VBoxContainer/MasterSlider.value))


func _on_bgm_slider_drag_ended(value_changed: bool) -> void:
	AudioServer.set_bus_volume_db(bgm_idx, linear_to_db($VBoxContainer/BGMSlider.value))


func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	AudioServer.set_bus_volume_db(sfx_idx, linear_to_db($VBoxContainer/SFXSlider.value))


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title-screen/title-screen.tscn")


func _on_pause_button_pressed() -> void:
	visible = true
	get_tree().paused = true
