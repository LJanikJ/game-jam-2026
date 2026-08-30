extends Node2D

signal final_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_tabletop_view_items_empty() -> void:
	get_tree().paused = true
	self.show()


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/title-screen/title-screen.tscn")


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_tabletop_view_final_score(score: int, num_bad: int) -> void:
	# Set the rich text label's number for score
	# right now placeholder is 999
	final_score.emit(score, num_bad)
