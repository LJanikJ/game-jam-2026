extends TextureButton

var magic_school : String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	disabled = true


func _on_dialogue_label_hidden() -> void:
	disabled = false 


func _on_tabletop_view_new_item(_item_type: String, _item_name: String, item_magic_school : String) -> void:
	magic_school = item_magic_school
